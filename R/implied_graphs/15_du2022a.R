#### Implied graph code #### 

ig_15_du2022a <- dagitty(
'dag {
dust_microbiome [exposure]
allergy [outcome]
dust_microbiome -> allergy 
gender -> dust_microbiome
gender -> allergy
age -> allergy
age -> dust_microbiome
urbanicity -> allergy
urbanicity -> dust_microbiome
genetic_disorders_family -> allergy
genetic_disorders_family -> dust_microbiome
season -> allergy
season -> dust_microbiome
humidity -> allergy
humidity -> dust_microbiome
temperature -> dust_microbiome
indoor_CO2 -> dust_microbiome
outdoor_microbiome -> dust_microbiome
}
'
) 

#### Edges in graph #### 
edges_15_du2022a <- edges(ig_15_du2022a) %>% 
  mutate(
    Num = 15,
    Edge = paste(v,e,w)
  ) %>% 
  select(-c(x,y))

#### Log explanations #### 
edges_15_du2022a <- edges_15_du2022a %>% 
  mutate(
    Explanation = 
      case_when(
        Edge == "dust_microbiome -> allergy" ~ "main",
        Edge == "gender -> dust_microbiome" ~ "adjusted for gender",
        Edge == "gender -> allergy" ~ "adjusted for gender",
        Edge == "urbanicity -> allergy" ~ "adjusted for urbanicity",
        Edge == "urbanicity -> dust_microbiome" ~ "adjusted for urbanicity",
        Edge == "age -> allergy" ~ "adjusted for age",
        Edge == "age -> dust_microbiome" ~ "adjusted for age",
        Edge == "genetic_disorders_family -> allergy" ~ "adjusted for genetic_disorders_family",
        Edge == "genetic_disorders_family -> dust_microbiome" ~ "adjusted for genetic_disorders_family",
        Edge == "season -> allergy" ~ "concluded: season related to allergies",
        Edge == "season -> dust_microbiome" ~ "concluded: season related to dust_microbiome",
        Edge == "humidity -> allergy" ~ "concluded: dampness/mold related to allergies",
        Edge == "humidity -> dust_microbiome" ~ "concluded: dampness/mold related to dust_microbiome",
        Edge == "temperature -> dust_microbiome" ~ "concluded: temperature correlated with dust_microbiome",
        Edge == "indoor_CO2 -> dust_microbiome" ~ "concluded: indoor_CO2 correlated with dust_microbiome",
        Edge == "outdoor_microbiome -> dust_microbiome" ~ "concluded: outdoor_microbiome correlated with dust_microbiome"
      )
  )

#### Save implied graph #### 

jpeg(filename=paste0(figfolder,"/ig_15_du2022a.jpg"),
     width=5, height=4, units="in", res=300)
plot(ig_15_du2022a)
dev.off()
