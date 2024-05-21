#### Implied graph code #### 

ig_1_fu2023 <- dagitty(
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
}
'
) 

#### Edges in graph #### 
edges_1_fu2023 <- edges(ig_1_fu2023) %>% 
  mutate(
    Num = 1,
    Edge = paste(v,e,w)
    ) %>% 
  select(Num, Edge)

#### Log explanations #### 
edges_1_fu2023 <- edges_1_fu2023 %>% 
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
        Edge == "humidity -> dust_microbiome" ~ "microbiome mediates the effect of humidity on allergies",
        Edge == "dust_weight -> dust_microbiome" ~ "microbiome mediates the effect of dust weight on allergies",
      )
  )

#### Save implied graph #### 

jpeg(filename=paste0(figfolder,"/ig_1_fu2023.jpg"),
     width=4, height=4, units="in", res=300)
plot(ig_1_fu2023)
dev.off()
