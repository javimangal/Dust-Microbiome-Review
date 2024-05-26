#### Implied graph code #### 

ig_37_fu2020a <- dagitty(
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
}
'
) 

#### Edges in graph #### 
edges_37_fu2020a <- edges(ig_37_fu2020a) %>% 
  mutate(
    Num = 37,
    Edge = paste(v,e,w)
  ) %>% 
  select(-c(x,y))

#### Log explanations #### 
edges_37_fu2020a <- edges_37_fu2020a %>% 
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
        Edge == "humidity -> dust_microbiome" ~ "indoor dampness/ visible mold was associated with asthma-associated bacteria",
      )
  )

#### Save implied graph #### 

jpeg(filename=paste0(figfolder,"/ig_37_fu2020a.jpg"),
     width=5, height=4, units="in", res=300)
plot(ig_37_fu2020a)
dev.off()
