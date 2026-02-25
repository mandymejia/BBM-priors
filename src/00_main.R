# Main script to run reproducibility demo in GitHub repository 

# Initialize libraries
Sys.setenv(R_LIBS_USER='$R_LIBS_USER')
################################################################
#
# SET THE LOCATION OF THE SCRIPT FILES
#
################################################################
sourcedir = "~/Documents/GitHub/BayesianBrainMapping-priors/src"
#sourcedir = "src"

# Setup up dependencies and parameters
source(file.path(sourcedir, "0_setup.R"))

# Run framewise displacement filtering 
source(file.path(sourcedir, "1_fd_time_filtering.R"))

# Filter unrelated subjects
source(file.path(sourcedir, "2_unrelated_filtering.R"))

# Balance sex within age groups
source(file.path(sourcedir, "3_balance_age_sex.R"))

# Prepare Yeo17 parcellation for Prior estimation
source(file.path(sourcedir, "4_parcellations.R"))

######## Begin estimate priors over the parameter sweep defined in 0_setup.R ######
source(file.path(sourcedir,"5_estimate_prior.R"))

# Intialize performance summary
performance_tbl <- tibble(
  encoding = character(),
  nIC = integer(),
  GSR = logical(),
  elapsed_sec = numeric(),
  user_sec = numeric(),
  sys_sec = numeric(),
  num_thr = numeric()
)

# Go over parameter sweep

for(encoding in encoding_sweep){
  for(nIC in nIC_sweep){
    for(GSR in GSR_sweep){
      
      # run while saving performance data
      timing <- system.time({
        estimate_and_export_prior(encoding,
                                  nIC,
                                  GSR,
                                  dir_data,
                                  TR_HCP,
                                  usePar = nThreads)
      })
      
      performance_tbl <- add_row(
        performance_tbl,
        encoding = encoding,
        nIC = nIC,
        GSR = GSR,
        elapsed_sec = timing["elapsed"],
        user_sec = timing["user.self"],
        sys_sec = timing["sys.self"],
        num_thr = nThreads
      )
    }
  }
}

# save RDS with performance tibble
saveRDS(performance_tbl, file.path(dir_data, "outputs", "prior_estimation_timings.rds"))

##### Begin presenting prior results ######
# visualize prior maps
source(file.path(sourcedir,"6_visualization_prior.R"))

# find best match IC to order FC matrices
source(file.path(sourcedir,"7_best_match_IC.R"))

# visualize FC matrices
source(file.path(sourcedir,"8_visualization_FC.R"))

# visualize matrices of IC overlap
source(file.path(sourcedir,"9_dice_overlap.R"))

##### Begin brain mapping of single HCP subject with Yeo17 priors ########

source(file.path(sourcedir, "manuscript/manuscript_brainmap.R"))
# make visualization of posterior FC estimate maps
source(file.path(sourcedir, "manuscript/manuscript_brainmap_visualization.R"))


