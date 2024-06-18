#### Setup #### 
source("scripts/00_helperfunctions/alx_OutOfSight.R")

inputfolder <- "../data/processed"
figfolder <- "../results/output_figures/bacteria"
dir.create(figfolder, showWarnings = FALSE)

if ( !require("phyloseq", quietly = TRUE) )
  BiocManager::install("phyloseq")

# install additional color scales
if ( !require("RColorBrewer", quietly = TRUE) )
  BiocManager::install("RColorBrewer")

# install more convenient color scales
if ( !require("pals", quietly = TRUE) )
  BiocManager::install("pals")

#### Read data #### 
bacter <- readRDS(
  paste0(inputfolder,
         "/bacter_keep.rds")
) 

#### Rarefaction plot ####
ggrare2( bacter, step=50, label="SampleNames", color="Country" )

ggsave(
  filename = "rarefaction_curves_bacter.png",
  path = figfolder,
  width = 12, 
  height = 8,
  units = "in", 
  dpi = 300
)
