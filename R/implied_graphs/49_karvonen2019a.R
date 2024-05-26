#### Implied graph code #### 

ig_49_karvonen2019a <- dagitty(
  'dag {
dust_microbiome [exposure]
allergy [outcome]
dust_microbiome -> allergy 
gender -> dust_microbiome
gender -> allergy
smoking_pregnancy -> allergy
smoking_pregnancy -> dust_microbiome
maternal_allergy -> allergy
maternal_allergy -> dust_microbiome
animal_contact -> dust_microbiome
ventilation -> dust_microbiome
building_material -> dust_microbiome
}
'
) 

#### Edges in graph #### 
edges_49_karvonen2019a <- edges(ig_49_karvonen2019a) %>% 
  mutate(
    Num = 49,
    Edge = paste(v,e,w)
  ) %>% 
  select(-c(x,y))

#### Log explanations #### 
edges_49_karvonen2019a <- edges_49_karvonen2019a %>% 
  mutate(
    Explanation = 
      case_when(
        Edge == "dust_microbiome -> allergy" ~ "main",
        Edge == "gender -> dust_microbiome" ~ "adjusted for gender",
        Edge == "gender -> allergy" ~ "adjusted for gender",
        Edge == "smoking_pregnancy -> allergy" ~ "adjusted for maternal smoking during pregnancy",
        Edge == "smoking_pregnancy -> dust_microbiome" ~ "adjusted for maternal smoking during pregnancy",
        Edge == "maternal_allergy -> allergy" ~ "adjusted for maternal allergies",
        Edge == "maternal_allergy -> dust_microbiome" ~ "adjusted for maternal allergies",
        Edge == "number_siblings -> allergy" ~ "adjusted for number of siblings",
        Edge == "number_siblings -> dust_microbiome" ~ "adjusted for number of siblings",
        Edge == "farming -> allergy" ~ "adjusted for living in a farm",
        Edge == "farming -> dust_microbiome" ~ "adjusted for living in a farm",
        Edge == "animal_contact -> dust_microbiome" ~ "associated with asthma-related microbes",
        Edge == "ventilation -> dust_microbiome" ~ "associated with asthma-related microbes",
        Edge == "building_material -> dust_microbiome" ~ "associated with asthma-related microbes"
      )
  )

#### Save implied graph #### 

jpeg(filename=paste0(figfolder,"/ig_49_karvonen2019a.jpg"),
     width=5, height=4, units="in", res=300)
plot(ig_49_karvonen2019a)
dev.off()
