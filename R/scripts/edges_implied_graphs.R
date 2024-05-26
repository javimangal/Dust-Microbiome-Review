all_objects <- ls()

# Filter names with "edges_"
edges_names <- grep("^edges_", all_objects, value = TRUE)
tables_edges <- lapply(edges_names, get)

# Check if they are tibbles and combine:  
if (all(sapply(tables_edges, is.data.frame))) {
  combined_edges <- bind_rows(tables_edges)
} else {
  stop("Not all objects starting with 'edges_' are data.frames")
}

combined_edges <- combined_edges %>% 
  relocate(c(Num, Edge, Explanation))

write.csv(combined_edges, file.path(psfolder, "edges_implied_graphs.csv"), 
          row.names = FALSE)

rm(all_objects, edges_names, tables_edges)
