import os, sys, time, pickle, argparse, datetime, hashlib
import numpy as np
import pandas as pd

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import emu_fast as F

DATASET   = os.path.join(HERE, 'RML2016.10a_dict.pkl')
MEAN_PATH = os.path.join(HERE, 'norm_mean.npy')
STD_PATH  = os.path.join(HERE, 'norm_std.npy')
TEST_IDX  = os.path.join(HERE, 'test_split_indices.pkl')

VARIANTS = {
    'A_post_floor_hard':        dict(shift='post', rnd=False, sig='hard'),
    'B_term_floor_hard':        dict(shift='term', rnd=False, sig='hard'),
    'D_term_round_hard':        dict(shift='term', rnd=True,  sig='hard'),
    'G_term_floor_true':        dict(shift='term', rnd=False, sig='true'),
    'K_term_floor_lut64':       dict(shift='term', rnd=False, sig='lut64'),
    'B2_term_floor_hard_rndoff': dict(shift='term', rnd=False, sig='hard'),
    'G2_term_floor_true_rndoff': dict(shift='term', rnd=False, sig='true'),
}

def mif_fingerprint(d):
    h = hashlib.md5()
    for fn in sorted(os.listdir(d)):
        p = os.path.join(d, fn)
        if os.path.isfile(p):
            h.update(fn.encode())
            with open(p, 'rb') as fh:
                h.update(fh.read())
    return h.hexdigest()[:8]

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--mif-dir', default='mif', help='folder with the NEW .mif/.hex weights (default: mif)')
    ap.add_argument('--tag', default='hsig', help='short name for this weight set, used in cache/output names (default: hsig)')
    ap.add_argument('--variants', nargs='+', default=['B2_term_floor_hard_rndoff'])
    ap.add_argument('--limit', type=int, default=0, help='random subset of N frames (0 = all 22,000)')
    ap.add_argument('--batch', type=int, default=32)
    ap.add_argument('--float-acc', type=float, default=None,
                    help='float accuracy (%%) of the new inference model from the training log')
    ap.add_argument('--force', action='store_true', help='ignore cache and recompute')
    args = ap.parse_args()

    mif_dir = args.mif_dir if os.path.isabs(args.mif_dir) else os.path.join(HERE, args.mif_dir)
    assert os.path.isdir(mif_dir), f'MIF folder not found: {mif_dir}'
    fp = mif_fingerprint(mif_dir)
    print(f'MIF fingerprint: {fp}')

    print('loading dataset + split ...')
    mean_pos = np.load(MEAN_PATH).astype(np.float32).flatten()
    std_pos  = np.load(STD_PATH).astype(np.float32).flatten()
    with open(DATASET, 'rb') as f:
        data = pickle.load(f, encoding='latin1')
    with open(TEST_IDX, 'rb') as f:
        tidx = pickle.load(f)

    mods = sorted({k[0] for k in data})
    snrs = sorted({k[1] for k in data})
    frames = []
    for snr in snrs:
        for mod in mods:
            arr = data[(mod, snr)]
            for i in sorted(j for j in tidx[(mod, snr)] if j < arr.shape[0]):
                frames.append((mod, snr, i))
    print(f'  test frames: {len(frames)}')

    if args.limit and args.limit < len(frames):
        rng = np.random.default_rng(0)
        sel = np.sort(rng.choice(len(frames), args.limit, replace=False))
        frames = [frames[i] for i in sel]
        print(f'  using random subset of {len(frames)} frames')

    print('quantising inputs ...')
    X = np.stack([F.q_input(data[(m, s)][i], mean_pos, std_pos) for (m, s, i) in frames])
    y = np.array([mods.index(m) for (m, _, _) in frames], dtype=np.int64)
    snr_arr = np.array([s for (_, s, _) in frames])
    print(f'  X shape: {X.shape}')

    print(f'loading weights from {mif_dir} ...')
    W = F.load_weights(mif_dir)

    out = pd.DataFrame({'mod': [f[0] for f in frames],
                        'snr': snr_arr,
                        'local_index': [f[2] for f in frames],
                        'true_class_idx': y})

    results = {}
    for name in args.variants:
        if name not in VARIANTS:
            sys.exit(f'unknown variant {name}; choose from {list(VARIANTS)}')
        cfg = VARIANTS[name]
        cache = os.path.join(HERE, f'emu_cache_{args.tag}_{fp}_{name}_r{int(cfg["rnd"])}_{len(X)}.npy')
        if os.path.exists(cache) and not args.force:
            preds = np.load(cache)
            print(f'[{name}] cached ({os.path.basename(cache)})')
        else:
            print(f'[{name}] running ...')
            t0 = time.time()
            preds = np.zeros(len(X), dtype=np.int64)
            for i in range(0, len(X), args.batch):
                preds[i:i + args.batch] = F.infer_batch(X[i:i + args.batch], W, cfg).argmax(axis=1)
                if (i // args.batch) % 50 == 0:
                    print(f'  [{name}] {min(i + args.batch, len(X))}/{len(X)}  {time.time() - t0:.0f}s', flush=True)
            np.save(cache, preds)
        results[name] = preds
        out[name + '_pred_idx'] = preds

    hi = snr_arr >= 0
    print('\n' + '=' * 70)
    print(f'weights: {args.tag}   frames: {len(X)}')
    print(f"{'variant':<24}{'acc%':>8}{'acc>=0dB':>12}", end='')
    print(f"{'gap vs float':>16}" if args.float_acc is not None else '')
    print('-' * 70)
    for name in args.variants:
        p = results[name]
        acc = 100 * (p == y).mean()
        acc_hi = 100 * (p[hi] == y[hi]).mean()
        line = f'{name:<24}{acc:8.2f}{acc_hi:12.2f}'
        if args.float_acc is not None:
            line += f'{acc - args.float_acc:+16.2f}'
        print(line)
    print('=' * 70)

    first = args.variants[0]
    print(f'\nPer-SNR accuracy ({first}):')
    for s in sorted(set(snr_arr.tolist())):
        m = snr_arr == s
        print(f'  SNR {s:>4} dB : {100 * (results[first][m] == y[m]).mean():6.2f}%  (n={m.sum()})')

    ts = datetime.datetime.now().strftime('%Y%m%d_%H%M%S')
    out_path = os.path.join(HERE, f'emu_{args.tag}_{ts}.csv')
    out.to_csv(out_path, index=False)
    print(f'\nwrote {out_path}')

if __name__ == '__main__':
    main()
