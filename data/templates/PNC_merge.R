library(ciftiTools)

# Set path to Connectome Workbench (required for writing CIFTI files).
# Replace the path below with the actual location on your system.
ciftiTools.setOption("wb_path", "C:/Users/diego/Downloads/workbench-windows64-v2.1.0/workbench/bin_windows64")

atlas_dir <- file.path("C:/Users/diego/Documents/GitHub/NMF-prior", "PNC Group Atlas")
                       
# List dscalar files and sort in natural numeric order (PFN1 … PFN17)
fnames <- list.files(atlas_dir, pattern = "PFN\\d+_soft_parcel\\.dscalar\\.nii$",
                     full.names = TRUE)
pfn_nums <- as.integer(regmatches(fnames,
                                   regexpr("(?<=PFN)\\d+", fnames, perl = TRUE)))
fnames   <- fnames[order(pfn_nums)]
pfn_nums <- sort(pfn_nums)

# add labels from original paper based on Yeo17 doi:j.neuron.2020.01.029
pfn_names <- c("DefaultA",
               "SomMotA",
               "FrontParA",
               "SomMotB",
               "DorsAttnA",
               "VisPeri",
               "VentAttnA",
               "DefaultB",
               "VentAttnB",
               "VisCent",
               "SomMotC",
               "DefaultC",
               "SomMotD",
               "DorsAttnB",
               "FrontParB",
               "Auditory",
               "FrontParC"
)

# Read each single-map dscalar into an xifti object
xifti_list <- lapply(fnames, read_cifti)

# Merge all xifti objects column-wise into one dscalar with 17 maps
xifti_merged <- do.call(merge_xifti, xifti_list)

# Assign map names matching the source files
xifti_merged$meta$cifti$names <- pfn_names

# Save the merged dscalar
#write_cifti(xifti_merged, "PNC_Group_Atlas_merged.dscalar.nii")

# Save as rds
saveRDS(xifti_merged, "PNC_Group_Atlas_merged.rds")
