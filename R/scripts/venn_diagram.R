#### Setup #### 
source("scripts/00_helperfunctions/alx_OutOfSight.R")

inputfolder <- "../data/processed"
figfolder <- "../results/output_figures/bacteria"
dir.create(figfolder, showWarnings = FALSE)

if ( !require("phyloseq", quietly = TRUE) )
  BiocManager::install("phyloseq")

if ( !require("microbiome", quietly = TRUE) )
  BiocManager::install("microbiome")

if ( !require("VennDiagram", quietly = TRUE) )
  BiocManager::install("VennDiagram")

#### Read data #### 
bacter <- readRDS(
  paste0(inputfolder,
         "/bacter_rar_genus.rds")
) 

# Extract OTU 
otu_table <- otu_table(bacter) %>% data.frame 

# Metadata 
meta <- sample_data(bacter) %>% data.frame

# OTUs per Country 
otu_list <- lapply(split(otu_table, meta$Country), function(df) rownames(df))

#### Venn diagram #### 

venn_diagram <- venn.diagram(
  x = otu_list,
  category.names = names(otu_list),
  filename = NULL,
  output = TRUE
)

grid.draw(venn_diagram)

# Save plot
png(filename = paste0(figfolder, "/venn_diagram_bacteria_genus.png"),
    width = 800, height = 800)
grid.draw(venn_diagram)
dev.off()