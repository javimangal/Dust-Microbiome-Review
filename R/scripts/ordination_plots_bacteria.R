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
         "/bacter_rar_relative.rds")
) 

#### PCoA plot ####
pcoa <- ordinate( 
  bacter, 
  method="PCoA", 
  distance="bray"
)

pcoa_plot <- plot_ordination( 
  bacter, 
  pcoa, 
  axes=1:2, 
  color="Country") +
  geom_point(size = 3) + 
  stat_ellipse(type = "norm")

# Save plot 
ggsave(
  pcoa_plot,
  filename = paste0(figfolder,"/PCoA_bacter.png"),
  width = 9,
  height = 7,
  dpi = 300
)

# Save in case I need to edit plot later
saveRDS(
  pcoa_plot, 
  file = paste0(figfolder, "/PCoA_bacter_plot.rds")
  )