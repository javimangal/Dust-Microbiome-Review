# Columns to be included in table  
order_studies <- c(
  "Citation_key", 
  "Country", 
  "Microbiome_type",
  "Building", 
  "Dust_collector",
  "Allergy", 
  "Environmental_determinants", 
  "Environ_specify",
  "Study_Design",
  "Causal_statements", 
  "Variable_selection"
)

# Select columns and substitute NA for international space station in Country
studies_included <- data %>% 
  select(all_of(order_studies)) %>% 
  mutate(
    Country = case_when(
      is.na(Country) ~ "ISS",
      TRUE ~ Country
      ),
    Citation_key = paste0("@",Citation_key)
  )

write.csv(studies_included, 
          file.path(tabfolder, "Table_study_characteristics.csv"), 
          row.names = FALSE,
          na = "")

studies_included %>% 
  gt %>% 
  gtsave(filename = paste0(tabfolder, "/Table_study_characteristics.tex"))