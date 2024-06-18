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

#### Phylum plot ####
ps_plot_bar(
  fungi,
  group = "Country",
  taxrank = "Phylum",
  top = 10, 
  title="Fungi: Top 10 Phyla per country (averaged)",
  xlab.rel = 0.8 
) 

ggsave(
  filename = paste0(figfolder,"/Phylum_relative_abundance_top10.png"),
  width = 6,
  height = 4,
  dpi = 300
)

#### Class plot ####
ps_plot_bar(
  fungi,
  group = "Country",
  taxrank = "Class",
  top = 14, 
  title="Fungi: Top 14 Class per country (averaged)",
  xlab.rel = 0.8 
) 

ggsave(
  filename = paste0(figfolder,"/Class_relative_abundance_top14.png"),
  width = 9,
  height = 6,
  dpi = 300
)


#### Order plot ####
ps_plot_bar(
  fungi,
  group = "Country",
  taxrank = "Order",
  top = 30, 
  title="Fungi: Top 30 Order per country (averaged)",
  xlab.rel = 0.8 
) +
  theme(legend.key.size = unit(0.4, 'cm'))

ggsave(
  filename = paste0(figfolder,"/Order_relative_abundance_top30.png"),
  width = 9,
  height = 6,
  dpi = 300
)


#### Family plot ####
ps_plot_bar(
  fungi,
  group = "Country",
  taxrank = "Family",
  top = 30, 
  title="Fungi: Top 30 Family per country (averaged)",
  xlab.rel = 0.8 
) +
  theme(legend.key.size = unit(0.4, 'cm'))

ggsave(
  filename = paste0(figfolder,"/Family_relative_abundance_top30.png"),
  width = 9,
  height = 6,
  dpi = 300
)

#### Genus plot ####
ps_plot_bar(
  fungi,
  group = "Country",
  taxrank = "Genus",
  top = 35, 
  title="Fungi: Top 35 Genus per country (averaged)",
  xlab.rel = 0.8 
) +
  theme(legend.key.size = unit(0.4, 'cm'))

ggsave(
  filename = paste0(figfolder,"/Genus_relative_abundance_top35.png"),
  width = 9,
  height = 7,
  dpi = 300
)
