#### Setup #### 

# random seed
seed <- 2202

source("scripts/00_helperfunctions/alx_OutOfSight.R")

inputfolder <- "../data/processed"
psfolder <- "../data/processed"
dir.create(psfolder, showWarnings = FALSE)

if ( !require("phyloseq", quietly = TRUE) )
  BiocManager::install("phyloseq")

#### Read data #### 
fungi <- readRDS(
  paste0(inputfolder,
         "/fungi_keep.rds")
) 

#### Rarefy ####
fungi_rar <- rarefy_even_depth(
  fungi, 
  sample.size=2500, 
  rngseed=seed, 
  replace=FALSE 
)

#Save 
saveRDS(
  fungi_rar, 
  paste0(psfolder,"/fungi_rar.rds")
)