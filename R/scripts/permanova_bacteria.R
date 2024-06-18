#### Setup #### 

# random seed
seed <- 2202

source("scripts/00_helperfunctions/alx_OutOfSight.R")

inputfolder <- "../data/processed"
tabfolder <- "../results/output_tables/bacteria"
dir.create(tabfolder, showWarnings = FALSE)

if ( !require("phyloseq", quietly = TRUE) )
  BiocManager::install("phyloseq")

if ( !require("gt", quietly = TRUE) )
  BiocManager::install("gt")

#### Read data #### 
bacter <- readRDS(
  paste0(inputfolder,
         "/bacter_rar_relative.rds")
) 

#### Permanova #### 
permanova <- permanova2( 
  bacter, 
  distm = "bray",
  var = "Country",
  permutations = 999,
  rngseed = seed,
  hellinger = TRUE 
  )

# Save 
gtsave(
  permanova %>% gt,
  filename = "permanova_country_bacter.html",
  path = tabfolder
)

#### Dispersion Test #### 
dispersion <- hdisp( 
  bacter, 
  distm = "bray",
  vars = "Country"
)

saveRDS(
  dispersion, 
  file = paste0(figfolder, "/dispersion_country_bacter.rds")
)

#### Pairwise permanova #### 
pairwise_permanova <- pairwise.permanovas2( 
  bacter,
  variable = "Country",
  p.adjust.m = "BH",
  rngseed = seed,
  hellinger = TRUE 
)

# Save 
gtsave(
  pairwise_permanova %>% gt,
  filename = "pairwise_permanova_country_bacter.html",
  path = tabfolder
)
