#### Implied graph code #### 

ig_33_adams2021a <- dagitty(
'dag {
humidity [exposure]
dust_microbiome [exposure]
allergy [outcome]
dust_microbiome -> allergy
humidity -> dust_microbiome
humidity -> allergy
humidity -> endotoxin
endotoxin -> allergy
gender -> dust_microbiome
gender -> humidity
gender -> allergy
age -> allergy
age -> humidity
age -> dust_microbiome
humidity_home -> allergy
humidity_home -> humidity
humidity_home -> dust_microbiome
education_level -> allergy
education_level -> humidity
education_level -> dust_microbiome
}
'
) 

#### Edges in graph #### 
edges_33_adams2021a <- edges(ig_33_adams2021a) %>% 
  mutate(
    Num = 33,
    Edge = paste(v,e,w)
  ) %>% 
  select(-c(x,y))

#### Log explanations #### 
edges_33_adams2021a <- edges_33_adams2021a %>% 
  mutate(
    Explanation = 
      case_when(
        Edge == "dust_microbiome <-> allergy" ~ "main, note that exposure was mentioned 2 months later than respiratory symptoms. Questions on symptoms enquired about prior 12 months",
        Edge == "humidity -> dust_microbiome" ~ "part of the effect of water damage in school buildings is mediated through microbioal taxa",
        Edge == "humidity -> allergy" ~ "water damage in school building associated with respiratory symptoms",
        Edge == "humidity -> endotoxin" ~ "part of the effect of water damage in school buildings is mediated through endotoxin",
        Edge == "endotoxin -> allergy" ~ "endotoxin related to respiratory symptoms",
        Edge == "gender -> dust_microbiome" ~ "adjusted for gender",
        Edge == "gender -> humidity" ~ "adjusted for gender",
        Edge == "gender -> allergy" ~ "adjusted for gender",
        Edge == "age -> allergy" ~ "adjusted for age",
        Edge == "age -> humidity" ~ "adjusted for age",
        Edge == "age -> dust_microbiome" ~ "adjusted for age",
        Edge == "humidity_home -> allergy" ~ "adjusted for humidity at home",
        Edge == "humidity_home -> humidity" ~ "adjusted for humidity at home",
        Edge == "humidity_home -> dust_microbiome" ~ "adjusted for humidity at home",
        Edge == "education_level -> allergy" ~ "adjusted for education_level",
        Edge == "education_level -> humidity" ~ "adjusted for education_level",
        Edge == "education_level -> dust_microbiome" ~ "adjusted for education_level"
      )
  )

#### Save implied graph #### 

jpeg(filename=paste0(figfolder,"/ig_33_adams2021a.jpg"),
     width=5, height=4, units="in", res=300)
plot(ig_33_adams2021a)
dev.off()
