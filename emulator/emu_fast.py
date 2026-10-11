import os
import numpy as np

FRAC = 10
SCALE = 1 << FRAC
INPUT_LEN, INPUT_CH = 128, 2
FILTERS, CNN1_K, CNN2_K = 32, 3, 5
SE_CH = max(1, FILTERS // 8)
TCN_K, TCN_DIL = 3, [1, 2, 4]
NUM_CLASSES = 11
CLASS_NAMES = ['8PSK', 'AM-DSB', 'AM-SSB', 'BPSK', 'CPFSK',
               'GFSK', 'PAM4', 'QAM16', 'QAM64', 'QPSK', 'WBFM']

DEFAULT_CFG = dict(shift='post', rnd=False, sig='hard')

STATS = {'max_acc': 0}

def _track(raw):
    m = int(np.abs(raw).max())
    if m > STATS['max_acc']:
        STATS['max_acc'] = m
    return raw

def load_hex(mif_dir, name):
    p = os.path.join(mif_dir, f'{name}.hex')
    with open(p) as f:
        v = [int(l.strip(), 16) for l in f if l.strip()]
    return np.array([x - 65536 if x >= 32768 else x for x in v], dtype=np.int64)

def load_weights(mif_dir):
    W = {}
    for k, n in [('cnn1_k', 'cnn1_k'), ('cnn1_b', 'cnn1_b'),
                 ('cnn2_k', 'cnn2_k'), ('cnn2_b', 'cnn2_b'),
                 ('se1_k', 'se_fc1_k'), ('se1_b', 'se_fc1_b'),
                 ('se2_k', 'se_fc2_k'), ('se2_b', 'se_fc2_b'),
                 ('fbn_s', 'fbn_s'), ('fbn_b', 'fbn_b'),
                 ('hd_k', 'hd_k'), ('hd_b', 'hd_b'),
                 ('out_k', 'out_k'), ('out_b', 'out_b')]:
        W[k] = load_hex(mif_dir, n)
    for i in range(3):
        for s in ('c1_k', 'c1_b', 'c2_k', 'c2_b'):
            W[f'b{i}{s}'] = load_hex(mif_dir, f'b{i}{s}')
    return W

def sat16(x):
    return np.clip(x, -32768, 32767)

def _shift(x, cfg):
    return (x + (SCALE >> 1)) >> FRAC if cfg['rnd'] else x >> FRAC

def _matmul_exact(a, b):
    return np.rint(a.astype(np.float64) @ b.astype(np.float64)).astype(np.int64)

def _dense_acc(x, Wm, cfg):
    if cfg['shift'] == 'post':
        return _shift(_track(_matmul_exact(x, Wm)), cfg)
    P = x[:, :, None] * Wm[None, :, :]
    return _shift(P, cfg).sum(axis=1)

def _conv_acc(xp_list, Wk, cfg):
    if cfg['shift'] == 'post':
        cat = np.concatenate(xp_list, axis=2)
        K, Ci, Co = Wk.shape
        return _shift(_track(_matmul_exact(cat, Wk.reshape(K * Ci, Co))), cfg)
    acc = 0
    for xk, wk in zip(xp_list, Wk):
        P = xk[:, :, :, None] * wk[None, None, :, :]
        acc = acc + _shift(P, cfg).sum(axis=2)
    return acc

def _taps_same(x, K):
    B, T, C = x.shape
    off = (K - 1) // 2
    xp = np.zeros((B, T + K - 1, C), dtype=x.dtype)
    xp[:, off:off + T] = x
    return [xp[:, k:k + T] for k in range(K)]

def _taps_causal(x, K, dil):
    B, T, C = x.shape
    pad = (K - 1) * dil
    xp = np.zeros((B, T + pad, C), dtype=x.dtype)
    xp[:, pad:] = x

    return [xp[:, k * dil:k * dil + T] for k in range(K)]

_LUT_CACHE = {}

def _lut(n):
    if n not in _LUT_CACHE:
        step = 16384 // n
        centres = -8192 + np.arange(n) * step + step / 2.0
        _LUT_CACHE[n] = np.rint(SCALE / (1.0 + np.exp(-centres / SCALE))).astype(np.int64)
    return _LUT_CACHE[n]

def hsig(x, cfg):
    sig = cfg['sig']
    if sig == 'true':
        return np.rint(SCALE / (1.0 + np.exp(-x / SCALE))).astype(np.int64)
    if sig.startswith('lut'):
        n = int(sig[3:])
        step = 16384 // n
        idx = np.clip((x + 8192) // step, 0, n - 1)
        return _lut(n)[idx]
    t = (x * 128) >> FRAC
    return np.where(x <= -4 * SCALE, 0,
                    np.where(x >= 4 * SCALE, SCALE, 512 + t))

def conv_same(x, K, kernel, bias, cfg, relu=True):
    Ci = x.shape[2]
    Co = len(bias)
    Wk = kernel.reshape(K, Ci, Co)
    acc = bias[None, None, :] + _conv_acc(_taps_same(x, K), Wk, cfg)
    v = sat16(acc)
    return np.maximum(v, 0) if relu else v

def se_block(x, W, cfg):
    B, T, C = x.shape
    pooled = sat16(x.sum(axis=1) >> (T.bit_length() - 1))
    a1 = W['se1_b'][None, :] + _dense_acc(pooled, W['se1_k'].reshape(C, SE_CH), cfg)
    se1 = np.maximum(sat16(a1), 0)
    a2 = W['se2_b'][None, :] + _dense_acc(se1, W['se2_k'].reshape(SE_CH, C), cfg)
    gate = hsig(sat16(a2), cfg)

    return sat16(_shift(gate[:, None, :] * x, cfg))

def maxpool(x):
    B, T, C = x.shape
    return x.reshape(B, T // 2, 2, C).max(axis=2)

def tcn_conv(x, kernel, bias, dil, cfg, residual=None):
    Wk = kernel.reshape(TCN_K, FILTERS, FILTERS)
    acc = bias[None, None, :] + _conv_acc(_taps_causal(x, TCN_K, dil), Wk, cfg)
    if residual is not None:
        acc = acc + residual
    return np.maximum(sat16(acc), 0)

def gap_final_bn(x, fs, fb, cfg):
    B, T, C = x.shape
    if cfg['shift'] == 'post':
        scaled = _shift(_track((x * fs[None, None, :]).sum(axis=1)), cfg)
    else:
        scaled = _shift(x * fs[None, None, :], cfg).sum(axis=1)
    v = (scaled >> 6) + fb[None, :]
    return sat16(v)

def dense(x, kernel, bias, cfg, relu):
    Ci = x.shape[1]
    Co = len(bias)
    acc = bias[None, :] + _dense_acc(x, kernel.reshape(Ci, Co), cfg)
    v = sat16(acc)
    return np.maximum(v, 0) if relu else v

def infer_batch(xq, W, cfg=None):
    cfg = {**DEFAULT_CFG, **(cfg or {})}
    h = conv_same(xq, CNN1_K, W['cnn1_k'], W['cnn1_b'], cfg)
    h = conv_same(h, CNN2_K, W['cnn2_k'], W['cnn2_b'], cfg)
    h = se_block(h, W, cfg)
    h = maxpool(h)
    for i, d in enumerate(TCN_DIL):
        c1 = tcn_conv(h, W[f'b{i}c1_k'], W[f'b{i}c1_b'], d, cfg)
        h = tcn_conv(c1, W[f'b{i}c2_k'], W[f'b{i}c2_b'], d, cfg, residual=h)
    g = gap_final_bn(h, W['fbn_s'], W['fbn_b'], cfg)
    hd = dense(g, W['hd_k'], W['hd_b'], cfg, relu=True)
    return dense(hd, W['out_k'], W['out_b'], cfg, relu=False)

def predict(xq, W, cfg=None, batch=32):
    out = []
    for i in range(0, len(xq), batch):
        out.append(infer_batch(xq[i:i + batch], W, cfg).argmax(axis=1))
    return np.concatenate(out)

def q_input(frame, mean_pos, std_pos):
    iq = (frame - mean_pos[None, :]) / std_pos[None, :]
    v = np.rint(iq.T.astype(np.float64) * SCALE)
    return np.clip(v, -32768, 32767).astype(np.int64)
