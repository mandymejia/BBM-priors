## Subject-level posteriors

This directory contains the output of `fit_BBM()` and `id_engagements()` from the `BayesBrainMap` package. Pre-computed example posteriors for a single HCP subject will be automatically downloaded when running the demo. For reference, they can be accessed from [OSF](https://osf.io/k6vx8/files/osfstorage).

### Directory structure

```
posteriors/
└── sub-<id>/
    └── <template>/
        ├── sub-<id>_BBM.rds                    # Full BBM posterior object (fit_BBM output)
        ├── engagements_1session.rds             # Engagement results at a single Z-threshold
        ├── engagements_1session_multipleZ.rds   # Engagement results across multiple Z-thresholds
        ├── posterior_plots/                     # Per-network posterior mean and SE brain maps
        └── engagement_plots/                    # Engagement maps (raw and thresholded)
```

The included example subject (`sub-103111`) uses the Yeo17 template and is provided for demonstration purposes in `demo/demo_step2.Rmd`.
