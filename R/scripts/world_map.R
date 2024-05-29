# Extract data and change name of the UK to match countries dataset. 
mapdata <- map_data("world") %>% 
  mutate(Country = region) %>% 
  mutate(Country = case_when(
    Country == "UK" ~ "United Kingdom",
    TRUE ~ Country
  )) %>% 
  select(-(region))

# join data  
mapfig <- left_join(mapdata, countries_counts, by="Country")

# Check if join worked:  
mapfig %>% 
  group_by(Country) %>% 
  summarize(n=unique(n)) %>% 
  filter(n > 0) 

# Change 0 for NA 
mapfig$n[mapfig$n == 0] <- NA

# Generate map of studies included  
plot_map <- ggplot(mapfig, aes(x = long, y = lat, group = group)) +
  geom_polygon(aes(fill = n), color = "black") +
  scale_fill_gradient(name = "Published studies", low = "azure2", high = "dodgerblue4", na.value = "white") +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Indoor dust microbiome research articles per country") +
  theme(
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    axis.line = element_blank(),
    axis.text = element_blank(),
    axis.title = element_blank(),
    axis.ticks = element_blank()
  )

# Save 
ggsave("Figure_Map.png",
       plot = plot_map,
       width = 9,
       height = 5,
       path = figfolder,
       units = "in", 
       dpi = 600
)

## Generate a figure showing both the map and the regions

# Table of world regions:
table_regions <- countries %>% 
  group_by(Region) %>% 
  summarize(n = n()) %>% 
  mutate(Percentage = round(n/sum(n)*100,1) ) %>% 
  arrange(desc(n)) 

# Arrange in same figure and save: 
Figure_Map_Regions <- grid.arrange(
  plot_map,
  tableGrob(table_regions %>% column_to_rownames(var="Region")),
  heights = c(3, 1),
  nrow = 2
)

ggsave("Figure_Map_Regions.png",
       plot = Figure_Map_Regions,
       path = figfolder, 
       width = 9,  
       height = 7, 
       units = "in", 
       dpi = 900
)


