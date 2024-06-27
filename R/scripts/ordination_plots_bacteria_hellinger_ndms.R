#### Setup #### 
source("scripts/00_helperfunctions/alx_OutOfSight.R")

inputfolder <- "../data/processed"
figfolder <- "../results/output_figures/bacteria/beta_diversity/Country"
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
         "/bacter_rar_genus.rds")
) 

#### Hellinger transformation #### 
bacter <- transform_sample_counts(
  bacter,
  function(x) sqrt(x / sum(x))
)

#### NMDS ####
nmds <- ordinate( 
  bacter, 
  method="NMDS", 
  distance="bray",
  k = 3
)

stress_factor <- round(nmds$stress,3)

#### Plot axes 1 and 2 ####

nmds_plot <- plot_ordination( 
  bacter, 
  nmds, 
  axes = c(1,2), 
  color = "Country") +
  geom_point(size = 3) + 
  stat_ellipse(type = "norm") +
  labs(caption = paste("stress factor:",stress_factor))

# Save plot 
ggsave(
  nmds_plot,
  filename = paste0(figfolder,"/NMDS_bacter_hellinger.png"),
  width = 9,
  height = 7,
  dpi = 300
)

# Save in case I need to edit plot later
saveRDS(
  nmds_plot, 
  file = paste0(figfolder, "/NMDS_bacter_hellinger_plot.rds")
  )

#### Plot axes 1 and 2 ####

nmds_plot <- plot_ordination( 
  bacter, 
  nmds, 
  axes=c(1,3), 
  color="Country") +
  geom_point(size = 3) + 
  stat_ellipse(type = "norm") +
  labs(caption = paste("stress factor:",stress_factor))

# Save plot 
ggsave(
  nmds_plot,
  filename = paste0(figfolder,"/NMDS_bacter_hellinger_axes1and3.png"),
  width = 9,
  height = 7,
  dpi = 300
)

# Save in case I need to edit plot later
saveRDS(
  nmds_plot, 
  file = paste0(figfolder, "/NMDS_bacter_hellinger_plot_axes1and3.rds")
)
