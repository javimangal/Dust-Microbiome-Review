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
         "/bacter_rar.rds")
) 

#### Hellinger transformation #### 
bacter <- transform_sample_counts(
  bacter,
  function(x) sqrt(x / sum(x))
)

#### PCoA plot axes 1 and 2 ####
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
  filename = paste0(figfolder,"/PCoA_bacter_hellinger.png"),
  width = 9,
  height = 7,
  dpi = 300
)

# Save in case I need to edit plot later
saveRDS(
  pcoa_plot, 
  file = paste0(figfolder, "/PCoA_bacter_hellinger_plot.rds")
  )

#### PCoA plot axes 1 and 3 ####
pcoa <- ordinate( 
  bacter, 
  method="PCoA", 
  distance="bray"
)

pcoa_plot <- plot_ordination( 
  bacter, 
  pcoa, 
  axes=c(1,3), 
  color="Country") +
  geom_point(size = 3) + 
  stat_ellipse(type = "norm")

# Save plot 
ggsave(
  pcoa_plot,
  filename = paste0(figfolder,"/PCoA_bacter_hellinger_axes1and3.png"),
  width = 9,
  height = 7,
  dpi = 300
)

# Save in case I need to edit plot later
saveRDS(
  pcoa_plot, 
  file = paste0(figfolder, "/PCoA_bacter_hellinger_plot_axes1and3.rds")
)
