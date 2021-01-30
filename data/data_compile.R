# Sampling pancancer gene expression data

#### Setting up ####

# load packages
if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse)
library(SummarizedExperiment)
library(TCGAbiolinks)

#### Functions ####

# function to download data from TCGA and create RDS object
geneDataTCGA <- function(tcga_proj, path) {
  # identify desired data
  query_fpkm <- GDCquery(project = tcga_proj,
                         data.category = "Transcriptome Profiling",
                         data.type = "Gene Expression Quantification",
                         workflow.type = "HTSeq - FPKM-UQ")
  # download data
  GDCdownload(query_fpkm, directory = path)
  # read downloaded data
  fpkm <- GDCprepare(query_fpkm, directory = path)
  # save imported object to file
  write_rds(fpkm, file=paste0(path, "fpkm", tcga_proj, ".RDS"))
}

# function to extract desired metadata
extractMetadata <- function(cancer_dat, cancer) {
  # extract all metadata
  meta <- as.data.frame(colData(cancer_dat)) 
  meta <- meta %>%
    # add column with type of cancer
    mutate(cancer_type = cancer) %>%
    # keep only metadata of interest
    # barcode as unique identifier
    select(barcode, shortLetterCode, tumor_stage, age_at_diagnosis, 
           year_of_diagnosis, alcohol_history, race, ethnicity, gender, 
           vital_status, year_of_birth, year_of_death, days_to_death, 
           cancer_type) %>%
  return(meta)
  }

# function to extract all genes and join with metadata
extractAllGenes <- function(cancer_dat) {
  # extract all expression data
  fpkmDat <- as.data.frame(assays(cancer_dat)[[1]])
  # select only desired genes
  fpkmGene <- as.data.frame(t(fpkmDat)) %>%
    # convert rownames to column
    rownames_to_column("barcode")
  return(fpkmGene)
}

#### Data extraction ####

# identify cancer types
cancers <- c("BRCA", "KIRC", "COAD", "LUAD", "PRAD")

# download data if necessary
for (cancer in cancers) {
  # check to see if RDS file exists for a cancer
  if (file.exists(paste0("~/GDCdata/fpkmTCGA-", cancer, ".RDS"))) {
  } else {
    # download and compile gene data if file doesn't exist
    geneDataTCGA(paste0("TCGA-", cancer), "~/GDCdata/")
  }
}

# combine data
meta_dat <- data.frame()
genes_dat <- data.frame()
for (cancer in cancers) {
  # load RDS file
  fpkm <- read_rds(paste0("~/GDCdata/fpkmTCGA-", cancer, ".RDS"))
  # extract metadata
  meta_temp <- extractMetadata(fpkm, cancer)
  # combine metadata
  meta_dat <- bind_rows(meta_dat, meta_temp)
  # extract gene data
  genes_temp <- extractAllGenes(fpkm)
  # write single cancer gene data
  write_csv(genes_temp, file=paste0(cancer, "genes.csv"))
  # combine gene data
  genes_dat <- bind_rows(genes_dat, genes_temp)
}

# write compiled files
write_csv(meta_dat, "metadata.csv")
write_csv(genes_dat, "genes.csv")
