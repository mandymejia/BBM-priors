## Estimated priors

This directory is populated either by running `estimate_prior()` from the `BayesBrainMap` package, or by downloading pre-calculated priors from [OSF](https://osf.io/k6vx8/files/osfstorage).

### Directory structure

```
priors/
├── filtering/       # Subject selection tables produced by src/01–03
└── <template>/      # One subdirectory per template (e.g. Yeo17/)
    ├── prior_<encoding>_<template>_<GSR|noGSR>.rds   # Estimated prior object
    ├── plots_maps/  # Brain map visualizations of prior mean and SD per network
    └── plots_FC/    # Functional connectivity matrix visualizations
```

### filtering/

Contains CSV and RDS tables tracking subjects at each selection stage:

- `fd_*` — framewise displacement quality-control results
- `valid_*_FD.*` — subjects passing motion filtering
- `valid_*_unrelated.*` — subjects further filtered for unrelatedness
- `valid_*_balanced.*` — final balanced (age/sex) subject lists

Suffixes `combined`, `LR`, and `RL` refer to the combined dataset and the two HCP phase-encoding directions respectively.

### Prior RDS files

Large objects containing both the spatial and FC priors. Each file name includes the settings used:

```
prior_<encoding>_<template>_<GSR|noGSR>.rds
```

For example, `prior_combined_Yeo17_noGSR.rds` is estimated on the combined LR+RL HCP dataset using the Yeo17 template without global signal regression.
