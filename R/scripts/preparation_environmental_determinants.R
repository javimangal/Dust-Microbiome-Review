categories_environmental_determinants <- 
  list(
    air_pollutants <- c(
      "black carbon",
      "indoor CO2",
      "indoor NO2",
      "indoor PM2.5",
      "indoor PM10",
      "outdoor coarse particles",
      "outdoor fine particles",
      "outdoor NO",
      "outdoor NO2",
      "outdoor PM10",
      "outdoor PM2.5",
      "outdoor SO2",
      "traffic air pollution"
    ) %>% setLabel("air pollutants"),
    allergen <- c(
      "alternaria allergen",
      "aspergillus allergen",
      "cat allergen",
      "cockroach allergen",
      "dog allergen",
      "mite allergen",
      "mouse allergen"
    ) %>% setLabel("allergen"),
    building_characteristics <- c(
      "age of building",
      "building architecture",
      "building condition",
      "building function",
      "building material",
      "building organization of space",
      "building orientation",
      "building structure",
      "building type",
      "curtains",
      "curtains size",
      "textile curtain factor",
      "distance from bed",
      "floor level",
      "floor material",
      "floor type",
      "gas cooker",
      "housing type",
      "human use patterns",
      "location in building",
      "number of rooms",
      "privacy index",
      "open kitchen connected to the living room",
      "ratio of window to floor area",
      "recent renovation",
      "roof type",
      "room type",
      "size of indoor environment",
      "wall surface type",
      "wing",
      "woodstove"
    ) %>% setLabel("building characteristics"),
    chemicals <- c(
      "ambient chemical compounds",
      "DEHP",
      "endotoxin",
      "ergosterol",
      "formaldehyde",
      "microbial toxins",
      "microplastics",
      "muramic acid",
      "pesticides",
      "polybrominated diphenyl ethers (PBDEs)"
    ) %>% setLabel("chemicals"),
    cleaning_habits <- c(
      "cleaning",
      "cleaning habits",
      "cleaning frequency",
      "cleaning method",
      "cleaning status",
      "net weight of vacuumed dust as indicator of cleaning habits"
    ) %>% setLabel("cleaning habits"),
    farming <- c(
      "farm",
      "farmer",
      "farming",
      "living on farm",
      "type of farming"
    ) %>% setLabel("farming"),
    furniture <- c(
      "electronics",
      "furniture surfaces",
      "furniture"
    ) %>% setLabel("furniture"),
    geography <- c(
      "altitude",
      "climate",
      "density of buildings",
      "density of roads",
      "distance between buildings",
      "distance from the Equator",
      "distance to city center",
      "distance to coast",
      "elevation",
      "geographical location",
      "geographical distance",
      "hog density",
      "land use",
      "living near expressway",
      "meteorological conditions",
      "other geographical data",
      "population density",
      "precipitation",
      "wind speed"
    ) %>% setLabel("geography"),
    green_environment <- c(
        "biodiversity of forests nearby",
        "flowering plants in vicinity",
        "green spaces",
        "green-renovated building",
        "indoor plants",
        "main vascular plant species outdoors",
        "number of indoor plants",
        "plant diversity",
        "plants",
        "plants in building",
        "plants in room",
        "percentage of woody vegetation cover",
        "proximity to green areas",
        "residential green space",
        "species of indoor plants",
        "vascular plant diversity"
      ) %>% setLabel("green environment"),
    heating <- c(
      "heating",
      "heating systems",
      "type of heating"
    ) %>% setLabel("heating"),
    humidity <- c(
      "dampness",
      "degree of flood-related damage",
      "flooded building",
      "humidity",
      "humidity variance",
      "indoor relative humidity",
      "moisture",
      "moisture damage",
      "relative humidity",
      "water leaks",
      "water damage"
    ) %>% setLabel("humidity/dampness"),
    infestation <- c(
      "bug infestation",
      "cockroaches",
      "infestations",
      "insecticide use",
      "rodents",
      "mites",
      "pests"
    ) %>% setLabel("infestation"),
    light <- c(
      "light",
      "light in microenvironment"
    ) %>% setLabel("light"),
    mold <- c(
      "visible mold",
      "mold"
    ) %>% setLabel("mold"),
    number_occupants <- c(
      "adult inhabitants",
      "children",
      "household members",
      "number of inhabitants",
      "number of occupants",
      "occupants",
      "occupant density",
      "person visits per day",
      "time that people spend in room"
    ) %>% setLabel("building occupants"),
    outdoor_microbiome <- c(
      "arid wasteland soil",
      "farm dust microbiome",
      "lakeshore soil",
      "outdoor microbiome",
      "outdoor haze microbiome",
      "soil microbiome",
      "woods soil"
    ) %>% setLabel("outdoor microbiome"),
    pets <- c(
      "birds",
      "cat",
      "dog",
      "guinea pig",
      "hamster",
      "pets",
      "rabbit"
    ) %>% setLabel("pets"),
    season <- c(
      "season",
      "month of sampling"
    ) %>% setLabel("season"),
    smoking <- c(
      "smoking",
      "tobacco exposure"
    ) %>% setLabel("smoking"),
    temperature <- c(
      "temperature",
      "temperature outdoor",
      "temperature variance"
    ) %>% setLabel("temperature"),
    urbanicity <- c(
      "urbanicity"
    ) %>% setLabel("urbanicity"),
    ventilation <- c(
      "aeration time",
      "airflow rate",
      "air conditioning",
      "air exchange rate",
      "natural ventilation",
      "number of windows",
      "outdoor air delivery rate",
      "proportion of apertures",
      "type of ventilation",
      "ventilation"
    ) %>% setLabel("ventilation"),
    water_sources <- c(
      "distance to water",
      "water sources"
    ) %>% setLabel("water sources"),
    other <- c(
      "composting",
      "carbon in dust",
      "dust pH",
      "dust salinity",
      "dust redox potential",
      "dust conductivity",
      "grass seeds",
      "height of sampling",
      "human oral microbiome",
      "nitrogen in dust",
      "occupational exposure",
      "soil pH",
      "use of antimicrobials"
    ) %>% setLabel("other")
  )

# Extract categories from labels in objects:   
categories <- data.frame(labels = character(),
                        values = character(), 
                        stringsAsFactors = FALSE)

for (category in categories_environmental_determinants) {
  label <- attr(category, "label")
  
  values <- paste0(category, collapse = ", ")
  
  categories <- rbind(
    categories, 
    data.frame(labels = label, values = values, stringsAsFactors = FALSE)
    )
}

# Rename categories
categories <- categories %>% 
  rename(
    Environmental_category = "labels",
    Environ_specify = "values"
    )

# Long format
categories_long <- categories %>%
  separate_rows(Environ_specify, sep = ", ")

# Add categories to environmental_determinants data
environmental_determinants <- environmental_determinants %>% 
  left_join(categories_long, by="Environ_specify")

# Add labels to environmental determinants data 
table1::label(environmental_determinants$Environmental_category) <- 
  "Category"

# Add labels to categories data and save as gt to export and save later:
table1::label(categories$Environmental_category) <- 
  "Category"
table1::label(categories$Environ_specify) <- 
  "Environmental determinants assessed"

categories <- categories %>% 
  gt %>% 
  cols_width(
    Environmental_category ~ pct(20),
    Environ_specify ~ pct(80)
  ) %>%
  tab_options(
    table.width = pct(100)
  )

# Save gt table 
## html 
gtsave(
  categories,
  filename = "html/categories_environmental_determinants.html",
  path = tabfolder
)

## word document 
doc <- read_docx()
doc <- body_add_gt(doc, value = categories)
print(
  doc, 
  target = file.path(tabfolder, "categories_environmental_determinants.docx")
  )
