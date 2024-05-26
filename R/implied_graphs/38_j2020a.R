#### Implied graph code #### 

ig_38_j2020a <- dagitty(
'dag {
dust_microbiome [exposure]
allergy [outcome]
dust_microbiome -> allergy 
}
'
) 

#### Edges in graph #### 
edges_38_j2020a <- edges(ig_38_j2020a) %>% 
  mutate(
    Num = 38,
    Edge = paste(v,e,w)
  ) %>% 
  select(-c(x,y))

#### Log explanations #### 
edges_38_j2020a <- edges_38_j2020a %>% 
  mutate(
    Explanation = 
      case_when(
        Edge == "dust_microbiome -> allergy" ~ "main",
      )
  )

#### Save implied graph #### 

jpeg(filename=paste0(figfolder,"/ig_38_j2020a.jpg"),
     width=5, height=4, units="in", res=300)
plot(ig_38_j2020a)
dev.off()
