#### Implied graph code #### 

ig_35_fu2021e <- dagitty(
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
urbanicity -> allergy
urbanicity -> dust_microbiome
dust_microbiome -> inflammation
inflammation -> allergy
dust_microbiome -> metabolism
metabolism -> allergy
}
'
) 

#### Edges in graph #### 
edges_35_fu2021e <- edges(ig_35_fu2021e) %>% 
  mutate(
    Num = 35,
    Edge = paste(v,e,w)
  ) %>% 
  select(-c(x,y))

#### Log explanations #### 
edges_35_fu2021e <- edges_35_fu2021e %>% 
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
        Edge == "urbanicity -> allergy" ~ "concluded urbanicity related to allergy",
        Edge == "urbanicity -> dust_microbiome" ~ "concluded urbanicity related to dust microbiome",
        Edge == "dust_microbiome -> inflammation" ~ "immune-related mechanisms could explain the effect of the dust microbiome on allergy",
        Edge == "inflammation -> allergy" ~ "immune-related mechanisms could explain the effect of the dust microbiome on allergy",
        Edge == "dust_microbiome -> metabolism" ~ "metabolism-related genes could explain the effect of the dust microbiome on allergy",
        Edge == "metabolism -> allergy" ~ "metabolism-related genes could explain the effect of the dust microbiome on allergy"
      )
  )

#### Save implied graph #### 

jpeg(filename=paste0(figfolder,"/ig_35_fu2021e.jpg"),
     width=5, height=4, units="in", res=300)
plot(ig_35_fu2021e)
dev.off()
