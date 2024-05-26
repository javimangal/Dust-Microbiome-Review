#### Implied graph code #### 

ig_32_vandenborght2021a <- dagitty(
'dag {
dust_microbiome [exposure]
allergy [outcome]
dust_microbiome -> inflammation
inflammation -> allergy
dust_microbiome <-> airway_microbiome
}
'
) 

#### Edges in graph #### 
edges_32_vandenborght2021a <- edges(ig_32_vandenborght2021a) %>% 
  mutate(
    Num = 32,
    Edge = paste(v,e,w)
  ) %>% 
  select(-c(x,y))

#### Log explanations #### 
edges_32_vandenborght2021a <- edges_32_vandenborght2021a %>% 
  mutate(
    Explanation = 
      case_when(
        Edge == "dust_microbiome -> inflammation" ~ "suggests that the effect of dust microbiome on allergy outcomes are mediated by inflammation",
        Edge == "inflammation -> allergy" ~ "suggests that the effect of dust microbiome on allergy outcomes are mediated by inflammation",
        Edge == "dust_microbiome <-> airway_microbiome" ~ "studied matching taxa. Directionality unkwnown since it is not mentioned if one preceded the other"
      )
  )

#### Save implied graph #### 

jpeg(filename=paste0(figfolder,"/ig_32_vandenborght2021a.jpg"),
     width=5, height=4, units="in", res=300)
plot(ig_32_vandenborght2021a)
dev.off()
