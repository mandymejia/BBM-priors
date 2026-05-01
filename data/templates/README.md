# Templates

All templates used in the companion paper are available either directly in this repository or after signing the relevant Data User Agreement (DUA). A detailed list including sources and adaptations is presented here.

## Yeo17

The Yeo 17-network cortical parcellation (See _The organization of the human cerebral cortex estimated by intrinsic functional connectivity_ [Yeo et al. 2011](https://doi.org/10.1152/jn.00338.2011). The HCP medial wall mask was applied and the result is saved as `Yeo17_simplified_mwall.rds`. The adaptation script is `Yeo17_simplify_mwall.R`.

## PROFUMO

Presented in _Modelling subject variability in the spatial and temporal characteristics of functional modes_ (Harrison et al. 2020), [doi:10.1016/j.neuroimage.2020.117226](https://doi.org/10.1016/j.neuroimage.2020.117226), can be downloaded from the study [repository](https://balsa.wustl.edu/study/gm40X) under the name `subject_maps_group12_run.dtseries.nii`.

After converting to dscalar, subcortical structures were removed and the HCP medial wall mask was applied. The resulting template is saved as `PROFUMO_simplified_mwall.rds`. The adaptation script is `PROFUMO_simplify_mwall.R`.

## MSC

An analogous process was performed for the MSC parcellation, available for download from the companion [repository](https://github.com/MidnightScanClub/MSCcodebase/blob/master/Utilities/Conte69_atlas-v2.LR.32k_fs_LR.wb/Networks_template.dscalar.nii). The resulting template is saved as `MSC_parcellation.rds`. The adaptation script is `MSC_simplify_mwall.R`.

## HCP (GICA)

HCP group ICA functional maps can be obtained from the HCP S1200 release, available within [ConnectomeDB](https://balsa.wustl.edu) after signing a Data User Agreement. Files should be placed in this directory following the naming scheme `GICA<N>.dscalar.nii`, where `N` is the number of ICs (e.g. `GICA15.dscalar.nii`, `GICA25.dscalar.nii`, `GICA50.dscalar.nii`).

## NMF (Group Atlas)

Functional topography map derived from non-negative matrix factorization (NMF) of 693 youths aged 8–23 years as part of the Philadelphia Neurodevelopmental Cohort (NMF) with over 27 min of high-quality fMRI data. See [Individual Variation in Functional Topography of Association Networks in Youth (Cui et al.)](https://doi.org/10.1016/j.neuron.2020.01.029) for details.