import os, sys, time, pickle, argparse, datetime
import numpy as np
import pandas as pd

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import emu_fast as F

MIF_DIR   = os.path.join(HERE, 'mif')
DATASET   = os.path.join(HERE, 'RML2016.10a_dict.pkl')
MEAN_PATH = os.path.join(HERE, 'norm_mean.npy')
STD_PATH  = os.path.join(HERE, 'norm_std.npy')
BOARD_CSV = os.path.join(HERE, 'board_full_sweep_results_20260724_123057.csv')
TEST_IDX  = os.path.join(HERE, 'test_split_indices.pkl')

VARIANTS = {
    'A_post_floor_hard':   dict(shift='post', rnd=False, sig='hard'),
    'B_term_floor_hard':   dict(shift='term', rnd=False, sig='hard'),
    'C_post_round_hard':   dict(shift='post', rnd=True,  sig='hard'),
    'D_term_round_hard':   dict(shift='term', rnd=True,  sig='hard'),
    'E_post_floor_true':   dict(shift='post', rnd=False, sig='true'),
    'F_post_round_true':   dict(shift='post', rnd=True,  sig='true'),
    'G_term_floor_true':   dict(shift='term', rnd=False, sig='true'),
    'H_term_round_true':   dict(shift='term', rnd=True,  sig='true'),
    'I_term_floor_lut256': dict(shift='term', rnd=False, sig='lut256'),
    'J_term_round_lut256': dict(shift='term', rnd=True,  sig='lut256'),
    'K_term_floor_lut64':  dict(shift='term', rnd=False, sig='lut64'),
    'L_post_floor_lut64':  dict(shift='post', rnd=False, sig='lut64'),
    'M_post_round_lut64':  dict(shift='post', rnd=True,  sig='lut64'),
}

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--limit', type=int, default=0)
    ap.add_argument('--variants', nargs='+', default=list(VARIANTS))
    ap.add_argument('--batch', type=int, default=32)
    args = ap.parse_args()

    print('loading board CSV ...')
    bd = pd.read_csv(BOARD_CSV)
    print(f'  board rows: {len(bd)}')
    print(f'  board columns: {bd.columns.tolist()}')

    board_correct = (bd['pred_class'] == bd['expected_class']).sum()
    print(f'  board accuracy: {board_correct}/{len(bd)} = {100*board_correct/len(bd):.4f}%')

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
    print(f'  frames built: {len(frames)}')

    assert len(frames) == len(bd), 'frame count mismatch'
    ok = True
    for n in range(len(frames)):
        if frames[n][0] != bd['mod'].iloc[n] or frames[n][1] != int(bd['snr'].iloc[n]):
            ok = False
            print(f'  MISMATCH at row {n}: frames={frames[n][:2]}  csv=({bd["mod"].iloc[n]},{bd["snr"].iloc[n]})')
            break
    if ok:
        print('  frame order matches board CSV row-for-row ✓')
    else:
        print('  WARNING: frame order does NOT match board CSV')

    print('quantising inputs ...')
    X = np.stack([F.q_input(data[(m, s)][i], mean_pos, std_pos)
                  for (m, s, i) in frames])
    print(f'  X shape: {X.shape}')

    y = np.array([mods.index(m) for (m, _, _) in frames], dtype=np.int64)
    board_pred = bd['pred_class'].values.astype(np.int64)

    print('loading weights ...')
    W = F.load_weights(MIF_DIR)

    out = pd.DataFrame({
        'mod': [f[0] for f in frames],
        'snr': [f[1] for f in frames],
        'true_class_idx': y,
        'board_pred_idx': board_pred,
    })

    results = {}
    for name in args.variants:
        cfg = VARIANTS[name]
        cache = os.path.join(HERE, f'emu_cache_nosw_{name}_r{int(cfg["rnd"])}_{len(X)}.npy')
        if os.path.exists(cache):
            preds = np.load(cache)
            print(f'[{name}] cached')
        else:
            print(f'[{name}] running ...')
            t0 = time.time()
            preds = np.zeros(len(X), dtype=np.int64)
            for i in range(0, len(X), args.batch):
                preds[i:i+args.batch] = F.infer_batch(X[i:i+args.batch], W, cfg).argmax(axis=1)
                if (i // args.batch) % 50 == 0:
                    print(f'  [{name}] {i+args.batch}/{len(X)}  {time.time()-t0:.0f}s', flush=True)
            np.save(cache, preds)
        results[name] = preds
        out[name + '_pred_idx'] = preds

    print('\n' + '=' * 88)
    print(f"{'variant':<24}{'acc%':>8}{'agree/board%':>16}{'acc>=0dB':>12}   description")
    print('-' * 88)
    hi = out['snr'] >= 0
    print(f"{'BOARD (reference)':<24}"
          f"{100*(board_pred==y).mean():8.2f}{100.0:16.2f}"
          f"{100*(board_pred[hi]==y[hi]).mean():12.2f}")
    for name in args.variants:
        p = results[name]
        acc      = 100 * (p == y).mean()
        agree_bd = 100 * (p == board_pred).mean()
        acc_hi   = 100 * (p[hi] == y[hi]).mean()
        print(f"{name:<24}{acc:8.2f}{agree_bd:16.2f}{acc_hi:12.2f}")
    print('=' * 88)

    ts = datetime.datetime.now().strftime('%Y%m%d_%H%M%S')
    out_path = os.path.join(HERE, f'emu_nosw_{ts}.csv')
    out.to_csv(out_path, index=False)
    print(f'\nwrote {out_path}')

if __name__ == '__main__':
    main()
