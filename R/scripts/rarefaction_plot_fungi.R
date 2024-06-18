#### Setup #### 
source("scripts/00_helperfunctions/alx_OutOfSight.R")

inputfolder <- "../data/processed"
figfolder <- "../results/output_figures/fungi"
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
fungi <- readRDS(
  paste0(inputfolder,
         "/fungi_keep.rds")
) 

#### Rarefaction plot ####
ggrare2( fungi, step=5000, label="SampleNames", color="Country" )

ggsave(
  filename = "rarefaction_curves_fungi.png",
  path = figfolder,
  width = 12, 
  height = 8,
  units = "in", 
  dpi = 300
)
