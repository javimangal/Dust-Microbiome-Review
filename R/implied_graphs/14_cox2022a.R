#### Implied graph code #### 

ig_14_cox2022a <- dagitty(
'dag {
dust_microbiome [exposure]
allergy [outcome]
dust_microbiome -> allergy
mold -> dust_microbiome
cleaning_habits -> dust_microbiome
ventilation -> dust_microbiome
pets -> dust_microbiome
dust_mites -> allergy
humidity <-> dust_mites
rodents -> allergy
cockroach -> allergy
neighborhood -> allergy
air_pollutants -> allergy
neighborhood -> air_pollutants
genetics -> allergy
genetics -> race
race -> neighborhood
race -> household_income
household_income -> moisture
moisture -> mold
household_income -> housing_quality
household_income -> neighborhood
housing_quality -> moisture
housing_quality -> rodents
housing_quality -> cockroach
neighborhood -> housing_quality
}
'
) 

#### Edges in graph #### 
edges_14_cox2022a <- edges(ig_14_cox2022a) %>% 
  mutate(
    Num = 14,
    Edge = paste(v,e,w)
  ) %>% 
  select(-c(x,y))

#### Log explanations #### 
edges_14_cox2022a <- edges_14_cox2022a %>% 
  mutate(
    Explanation = 
      case_when(
        Edge == "dust_microbiome -> allergy" ~ "main",
        TRUE ~ "as represented in DAG by authors"
      )
  )

#### Save implied graph #### 

jpeg(filename=paste0(figfolder,"/ig_14_cox2022a.jpg"),
     width=7, height=6, units="in", res=300)
plot(ig_14_cox2022a)
dev.off()
