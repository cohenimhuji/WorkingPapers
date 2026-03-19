# Building All Impulse Response Functions (IRFs)

All simulations and plotting are done in **MATLAB (R2025b)**, though earlier versions should also work.
The models are solved using **Dynare 6.5**.

Before running any scripts, make sure to add the functions folder to your MATLAB path:

addpath('functions');

## Reproducing Figures

### Figures 4, 6, A.1, A.2
Navigate to the folder `fixed`, then run:

run_all.m

### Figure 5
From the main directory, run:

Plot_n_Compare_IRFs_fixed_vs_variable_Nimrod_2026_03_01.m

If needed, this README can be extended with installation instructions, folder structure, or sample outputs.