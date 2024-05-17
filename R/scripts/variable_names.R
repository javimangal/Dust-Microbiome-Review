for (variable in names(data)) {

  if (variable == "Num") {
    table1::label(data$Num) <- "Study unique ID"
  }
    
  if (variable == "Title") {
    table1::label(data$Title) <- "Title of the study"
  }
  
  if (variable == "Name_journal") {
    table1::label(data$Name_journal) <- "Name of the journal"
  }
  
  if (variable == "Year") {
    data$Year <- as.integer(data$Year)
    table1::label(data$Year) <- "Year of publication"
  }

  if (variable == "Topics") {
    data$Topics <- factor(data$Topics,
      levels = c(0, 1, 2, 3, 4),
      labels = c(
        "None",
        "Microbiome, environment and allergy",
        "Microbiome and environment",
        "Microbiome and allergy",
        "Microbiome only"
        )
      ) %>% fct_drop()
    table1::label(data$Topics) <- "Topics assessed"
  }
  
  if (variable == "Microbiome_type") {
    data$Microbiome_type <- factor(data$Microbiome_type,
      levels = c(0, 1, 2, 3, 4, 5),
      labels = c(
        "Not applicable",
        "Bacterial",
        "Fungal",
        "Bacterial and Fungal",
        "Bacterial, Fungal and other",
        "Other"
        ) 
      ) %>% fct_drop()
    table1::label(data$Microbiome_type) <- "Type of microbiome studied"
  }
  
  if (variable == "Dust_collector") {
    data$Dust_collector <- data$Dust_collector %>% 
      gsub('1', 'EDC', . ) %>%  # Electrostatic dust collector 
      gsub('2', 'vacuum', . ) %>%  
      gsub('3', 'swab', . ) %>%  
      gsub('4', 'petri', . ) %>%  
      gsub('5', 'HVAC', . ) %>%  #Heating, ventilation, and air conditioning"
      gsub('6', 'other', . ) %>% 
      gsub('7', 'active-sampler', . )
    table1::label(data$Dust_collector) <- "Dust sample collector"
  }

  if (variable == "Multiple_collectors") {
    data$Multiple_collectors <- factor(data$Multiple_collectors,
      levels = c(0, 1),
      labels = c("No", "Yes")
    )
    table1::label(data$Multiple_collectors) <- "More than 1 collector"
  }

  if (variable == "Height_m") {
    units(data$Height_m) <- "meters"
    table1::label(data$Height_m) <- "Height of collector placement"
  }
  
  if (variable == "Days") {
    units(data$Days) <- "days"
    table1::label(data$Days) <- "Duration of dust settlement"
  }
  
  if (variable == "Allergy") {
    data$Allergy <- factor(data$Allergy,
      levels = c(0, 1),
      labels = c("No", "Yes")
    )
    table1::label(data$Allergy) <- "Allergy as topic"
  }
  
  if (variable == "Environmental_determinants") {
    data$Environmental_determinants <- factor(data$Environmental_determinants,
      levels = c(0, 1),
      labels = c("No", "Yes")
    )
    table1::label(data$Environmental_determinants) <- 
      "Environmental determinants as topic"
  }
  
  if (variable == "Environ_specify") {
    table1::label(data$Environ_specify) <- "Environmental determinants assessed"
  }
  
  if (variable == "Multiple_Countries") {
    data$Multiple_Countries <- factor(data$Multiple_Countries,
      levels = c(0, 1, 2),
      labels = c("No",
                 "Yes",
                 "ISS" # International space station
                 )
    )
    table1::label(data$Multiple_Countries) <- "More than 1 country"
  }
  
  if (variable == "Country") {
    table1::label(data$Country) <- "Country of sample collection"
  }
  
  if (variable == "ISO3") {
    table1::label(data$ISO3) <- "Code of country"
  }

  if (variable == "Study_Design") {
    data$Study_Design <- factor(data$Study_Design,
      levels = c(1, 2, 3, 4, 5, 6),
      labels = c(
        "Cross-sectional",
        "Cohort",
        "Case-control",
        "Experimental",
        "Systematic review",
        "Case report"
        ) 
    ) %>% fct_drop()
    table1::label(data$Study_Design) <- "Study design"
  }
  
  if (variable == "Causality") {
    data$Causality <- factor(data$Causality,
      levels = c(1, 2),
      labels = c(
        "Descriptive",
        "Causal"
        ) 
    ) %>% fct_drop()
    table1::label(data$Causality) <- "Causality"
  }
  
  if (variable == "Determinant") {
    table1::label(data$Determinant) <- "Exposure"
  }
  
  if (variable == "Determinant_specify") {
    table1::label(data$Determinant_specify) <- "Details of exposure"
  }

  if (variable == "Outcome") {
    table1::label(data$Outcome) <- "Outcome"
  }
  
  if (variable == "Outcome_specify") {
    table1::label(data$Outcome_specify) <- "Details of outcome"
  }
  
  if (variable == "Other_sampler") {
    table1::label(data$Other_sampler) <- "Specification of other sampler used"
  }
  
  if (variable == "Causal_statements") {
    data$Causal_statements <- factor(data$Causal_statements,
      levels = c(0, 1),
      labels = c("No", "Yes")
    )
    table1::label(data$Causal_statements) <- "Causal statements"
  }
  
  if (variable == "Variable_selection") {
    data$Variable_selection <- factor(data$Variable_selection, 
      levels=c(0,6,1,2,3,5,4), 
      labels=c(
        "Not applicable",
        "Confounding seldom considered",
        "Uninformed",
        "p-value or model-based",
        "beta-coeficient",
        "Historical confounder",
        "DAG"
        ),
      ordered = TRUE
      ) 
    table1::label(data$Variable_selection) <- "Variable identification method"
  }
 
  if (variable == "Building") {
    table1::label(data$Building) <- "Type of building"
  }
  
  if (variable == "Collector_comparison") {
    data$Collector_comparison <- factor(data$Collector_comparison,
      levels = c(0, 1),
      labels = c("No", "Yes")
    )
    table1::label(data$Collector_comparison) <- "Were dust collectors compared?"
  }
   
  if (variable == "Raw_sequences") {
    data$Raw_sequences <- factor(data$Raw_sequences,
      levels = c(0, 1),
      labels = c("No", "Yes")
    )
    table1::label(data$Raw_sequences) <- "Raw sequences provided"
  }
  
  if (variable == "Sequence_access_instructions") {
    table1::label(data$Sequence_access_instructions) <- 
      "Instructions to access raw sequences as provided in the paper"
  }
  
  if (variable == "Sequencing_bacteria") {
    table1::label(data$Sequencing_bacteria) <- 
      "Bacterial region sequenced and platform"
  }
  
  if (variable == "Sequencing_fungi") {
    table1::label(data$Sequencing_fungi) <- 
      "Fungal region sequenced and platform"
  }
}

rm(variable)
