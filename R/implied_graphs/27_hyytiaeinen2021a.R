#### Implied graph code #### 

ig_27_hyytiaeinen2021a <- dagitty(
'dag {
dust_microbiome [exposure]
allergy [outcome]
dust_microbiome -> allergy 
gender -> dust_microbiome
gender -> allergy
number_siblings -> allergy
number_siblings -> dust_microbiome
parental_atopy -> allergy
parental_atopy -> dust_microbiome
parent_education -> allergy
parent_education -> dust_microbiome
farming -> allergy
farming -> dust_microbiome
season -> allergy
season -> dust_microbiome
maternal_age_delivery -> allergy
maternal_age_delivery -> dust_microbiome
pets -> allergy
pets -> dust_microbiome
}
'
) 

#### Edges in graph #### 
edges_27_hyytiaeinen2021a <- edges(ig_27_hyytiaeinen2021a) %>% 
  mutate(
    Num = 27,
    Edge = paste(v,e,w)
  ) %>% 
  select(-c(x,y))

#### Log explanations #### 
edges_27_hyytiaeinen2021a <- edges_27_hyytiaeinen2021a %>% 
  mutate(
    Explanation = 
      case_when(
        Edge == "dust_microbiome -> allergy" ~ "main",
        Edge == "gender -> dust_microbiome" ~ "adjusted for gender",
        Edge == "gender -> allergy" ~ "adjusted for gender",
        Edge == "number_siblings -> allergy" ~ "adjusted for number_siblings",
        Edge == "number_siblings -> dust_microbiome" ~ "adjusted for number_siblings",
        Edge == "parental_atopy -> allergy" ~ "adjusted for parental_atopy",
        Edge == "parental_atopy -> dust_microbiome" ~ "adjusted for parental_atopy",
        Edge == "parent_education -> allergy" ~ "adjusted for parent_education",
        Edge == "parent_education -> dust_microbiome" ~ "adjusted for parent_education",
        Edge == "season -> allergy" ~ "adjusted for season",
        Edge == "season -> dust_microbiome" ~ "adjusted for season",
        Edge == "maternal_age_delivery -> allergy" ~ "adjusted for maternal_age_delivery",
        Edge == "maternal_age_delivery -> dust_microbiome" ~ "adjusted for maternal_age_delivery",
        Edge == "pets -> allergy" ~ "adjusted for different pet species",
        Edge == "pets -> dust_microbiome" ~ "adjusted for different pet species"
      )
  )

#### Save implied graph #### 

jpeg(filename=paste0(figfolder,"/ig_27_hyytiaeinen2021a.jpg"),
     width=5, height=4, units="in", res=300)
plot(ig_27_hyytiaeinen2021a)
dev.off()
