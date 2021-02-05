# Recommended data filtering for pancancer gene expression data

library(tidyverse)

#### Metadata filtering and transformation ####

metadat <- read_csv("metadata.csv")

# replace "not reported" with NA
metadat %>%
  mutate(across(where(is.character), 
              ~ str_replace(.x, regex("not reported", 
                                      ignore_case = TRUE), 
                            replacement = NA_character_)))

# include only primary tumor samples, not metastasized (TM) or normal (NT)
# this also removes duplicate samples for the same patient
metadat %>%
  filter(shortLetterCode == "TP")

#### Gene filtering and transformation ####

genes <- read_csv("genes.csv")

# remove genes with no expression
genes %>%
  select(-barcode) %>%
  colSums %>%
  as.data.frame %>%
  rownames_to_column(var = "barcode") %>%
  rename_with(~ gsub(".", "sum", .x, fixed=TRUE)) %>%
  filter(sum != 0) 

# transform gene expression values for easier analysis
genes %>%
  select(-barcode) %>%
  mutate(across(all_of(), ~log2(.x + 1)))

#### General filtering and manipulation ####

# joining metadata with gene expression data
metadat %>%
    left_join(genes, by = "barcode")
