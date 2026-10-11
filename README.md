# µTCN-AMR on FPGA — DE2-115

Verilog design, weights, test scripts and results for the paper
"FPGA Implementation of a Lightweight Hardware-Aware Temporal Convolutional Network for Automatic Modulation Recognition".
Archive DOI: **to be added after the Zenodo release**.

## Results (RML2016.10a, 22,000 held-out test frames)

| | |
|---|---|
| Board accuracy | 62.55 % (13,760 / 22,000); 91.59 % for SNR >= 0 dB |
| Float accuracy (software) | 63.36 % |
| Board vs bit-accurate emulator | 22,000 / 22,000 identical predictions |
| Latency | 3,817,005 cycles = 76.34 ms at 50 MHz |
| Quartus 20.1.1 (EP4CE115F29C7) | 3,952 LEs, 1,366 registers, 838,144 memory bits, 28 embedded 9-bit multiplier elements (14 signed 16x16 products x 2) |
| Timing (Slow 1200 mV 85 C) | Fmax 60.6 MHz; setup +3.497 ns, hold +0.286 ns at 50 MHz |

## Layout

```
rtl/        amr_tcn_de2115_v22.v, uart_top.v, mif/*.hex (Q6.10 weights, 26 files)
quartus/    amr_tcn_de2115_v22.qpf, .qsf, .sdc   (Quartus Prime Lite 20.1, EP4CE115F29C7)
emulator/   emu_fast.py, run_emulator_hsig.py, run_emulator_full_nosw.py
host/       run_board_full_sweep.py, run_board_heldout_quick.py, run_latency_check.py,
            compare_board_vs_emu.py
data/       norm_mean.npy, norm_std.npy, test_split_indices.pkl
results/    board CSV/JSON, emulator CSV, Quartus reports
```

The RML2016.10a dataset (`RML2016.10a_dict.pkl`) is not included; place it next to the scripts.

## Setup before running

Quartus and the Python scripts look for their input files in their own folder, so copy once:

1. **Quartus:** copy `amr_tcn_de2115_v22.v`, `uart_top.v` and the `mif/` folder from `rtl/` into `quartus/`.
2. **Emulator and host scripts:** copy `norm_mean.npy`, `norm_std.npy` and `test_split_indices.pkl` from `data/` into both `emulator/` and `host/`, and put `RML2016.10a_dict.pkl` in both folders as well. Run each script from inside its own folder.

Install the Python dependencies with `pip install -r requirements.txt`.

## Usage

```
cd emulator
python run_emulator_hsig.py --mif-dir ../rtl/mif --tag hsig --variants B2_term_floor_hard_rndoff --float-acc 63.36

cd ../host
python run_board_full_sweep.py
python compare_board_vs_emu.py --board ../results/board_full_sweep_results_20261007_145353.csv --emu ../emulator/emu_hsig_<date>.csv --allow-old
python run_latency_check.py
```

Variant names: `floor` = plain `>> 10` after every product (as in the RTL), `round` = round-to-nearest.

## Reproduce

1. Open `quartus/amr_tcn_de2115_v22.qpf` in Quartus Prime Lite 20.1, compile, and program the DE2-115 with the generated `.sof`.
2. Connect the board by USB-UART and run `python run_board_full_sweep.py` from `host/` (about 22,000 frames at ~0.12 s each).
3. Run the emulator and `compare_board_vs_emu.py` as shown above; the expected result is 22,000 / 22,000 identical predictions.

## Demo

A short video (about 4 MB) of the board running the inference is in `demo/demo.mp4`.
