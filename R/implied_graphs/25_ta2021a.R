#### Implied graph code #### 

ig_25_ta2021a <- dagitty(
'dag {
dust_microbiome [exposure]
allergy [outcome]
dust_microbiome -> allergy 
}
'
) 

#### Edges in graph #### 
edges_25_ta2021a <- edges(ig_25_ta2021a) %>% 
  mutate(
    Num = 25,
    Edge = paste(v,e,w)
  ) %>% 
  select(-c(x,y))

#### Log explanations #### 
edges_25_ta2021a <- edges_25_ta2021a %>% 
  mutate(
    Explanation = 
      case_when(
        Edge == "dust_microbiome -> allergy" ~ "main"
      )
  )

#### Save implied graph #### 

jpeg(filename=paste0(figfolder,"/ig_25_ta2021a.jpg"),
     width=5, height=4, units="in", res=300)
plot(ig_25_ta2021a)
dev.off()