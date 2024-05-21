#### Implied graph code #### 

ig_9_fu2022a <- dagitty(
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
humidity -> dust_microbiome
dust_weight -> dust_microbiome
indoor_CO2 -> dust_microbiome
}
'
) 

#### Edges in graph #### 
edges_9_fu2022a <- edges(ig_9_fu2022a) %>% 
  mutate(
    Num = 9,
    Edge = paste(v,e,w)
  ) %>% 
  select(Num, Edge)

#### Log explanations #### 
edges_9_fu2022a <- edges_9_fu2022a %>% 
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
        Edge == "humidity -> dust_microbiome" ~ "effect of humidity potentially mediated through dust microbiome",
        Edge == "dust_weight -> dust_microbiome" ~ "effect of dust weight potentially mediated through dust microbiome",
        Edge == "indoor_CO2 -> dust_microbiome" ~ "effect of indoor CO2 potentially mediated through dust microbiome",
      )
  )

#### Save implied graph #### 

jpeg(filename=paste0(figfolder,"/ig_9_fu2022a.jpg"),
     width=4, height=4, units="in", res=300)
plot(ig_9_fu2022a)
dev.off()
