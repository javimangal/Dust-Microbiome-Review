#### Setup #### 
inputfolder <- "../data/processed"
psfolder <- "../data/processed"
dir.create(psfolder, showWarnings = FALSE)

require("BiocManager")

if ( !require("phyloseq", quietly = TRUE) )
  BiocManager::install("phyloseq")


#### Read data #### 
fungi <- readRDS(
  paste0(inputfolder,
         "/fungi_keep.rds")
) 

#### Convert to relative abundance ####
fungi_relative <- transform_sample_counts( 
  fungi, 
  function(x) x / sum(x) * 100 
)

# Save 
saveRDS(
  fungi_relative, 
  paste0(psfolder,"/fungi_relative.rds")
)