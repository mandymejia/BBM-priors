# AGENTS.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

This repository holds population-derived priors/templates for Bayesian Brain Mapping (BBM), also known as template ICA. It accompanies the manuscript "Bayesian brain mapping: population-informed individualized functional topography and connectivity" by Da Silva Sanchez et al.

## Key Dependencies

- **R packages**: `BayesBrainMap`, `ciftiTools`, `fMRIscrub`, `kableExtra`, `magrittr`, `knitr`, `rgl`, `bookdown`
- **External tools**: Connectome Workbench (`wb_command`) must be installed and path configured via `wb_path`
- **Data format**: CIFTI neuroimaging format (`.dtseries.nii`, `.dlabel.nii`)

## Repository Structure

- `demo/BBM-demo.Rmd` - Main tutorial/demo showcasing the full BBM workflow
- `demo/data/` - Directory for input/output data (requires download from OSF)

## Running the Demo

1. Download required data from [OSF](https://osf.io/k6vx8/files/osfstorage)
2. Place `data_OSF/` and `priors/` folders in the project root
3. Open and knit `demo/BBM-demo.Rmd` in RStudio

```r
# Render the demo
rmarkdown::render("demo/BBM-demo.Rmd")
```

## BayesBrainMap Package Usage

The demo uses two main functions from `BayesBrainMap`:

1. **`estimate_prior()`** - Estimates group-level statistical priors from training data
   - Requires BOLD fMRI paths, template parcellation, and preprocessing parameters
   - Resource-intensive (~27 hours, 135GB memory for ~350 subjects)

2. **`BrainMap()`** - Fits subject-level model using pre-estimated priors
   - Input: BOLD data paths and prior object
   - Output: Individualized functional network maps

3. **`engagements()`** - Identifies regions of significant deviation from prior mean

## Data Requirements

- HCP resting-state fMRI data in CIFTI format
- HCP demographic data (unrestricted and restricted CSVs) for subject filtering
- Yeo17 or GICA parcellations as template files

## Code Conventions

- Path variables are typically set at script top: `dir_project`, `dir_data`, `dir_HCP`, `wb_path`
- Subject filtering pipeline: FD motion filtering → unrelated filtering → sex/age balancing
- Prior naming convention: `prior_<encoding>_<parcellation>_<GSR>.rds` (e.g., `prior_combined_Yeo17_noGSR.rds`)
