#### Implied graph code #### 

ig_19_fu2021a <- dagitty(
'dag {
dust_microbiome [exposure]
allergy [outcome]
dust_microbiome -> allergy 
gender -> dust_microbiome
gender -> allergy
smoking -> allergy
smoking -> dust_microbiome
parental_asthma -> allergy
parental_asthma -> dust_microbiome
age_building -> dust_microbiome
wall_surface_type -> dust_microbiome
location_building -> dust_microbiome
indoor_green_environment -> dust_microbiome
}
'
) 

#### Edges in graph #### 
edges_19_fu2021a <- edges(ig_19_fu2021a) %>% 
  mutate(
    Num = 19,
    Edge = paste(v,e,w)
  ) %>% 
  select(-c(x,y))

#### Log explanations #### 
edges_19_fu2021a <- edges_19_fu2021a %>% 
  mutate(
    Explanation = 
      case_when(
        Edge == "dust_microbiome -> allergy" ~ "main",
        Edge == "gender -> dust_microbiome" ~ "adjusted for gender",
        Edge == "gender -> allergy" ~ "adjusted for gender",
        Edge == "smoking -> allergy" ~ "adjusted for smoking",
        Edge == "smoking -> dust_microbiome" ~ "adjusted for smoking",
        Edge == "parental_asthma -> allergy" ~ "adjusted for parental_asthma",
        Edge == "parental_asthma -> dust_microbiome" ~ "adjusted for parental_asthma",
        Edge == "age_building -> dust_microbiome" ~ "age of building associated with indoor dust microbiome",
        Edge == "wall_surface_type -> dust_microbiome" ~ "wall surface type associated with indoor dust microbiome",
        Edge == "location_building -> dust_microbiome" ~ "room level in building associated with indoor dust microbiome",
        Edge == "indoor_green_environment -> dust_microbiome" ~ "plants in room associated with indoor dust microbiome"
      )
  )

#### Save implied graph #### 

jpeg(filename=paste0(figfolder,"/ig_19_fu2021a.jpg"),
     width=5, height=4, units="in", res=300)
plot(ig_19_fu2021a)
dev.off()