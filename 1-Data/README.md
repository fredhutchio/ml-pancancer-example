# TCGA data aggregation for ml-pancancer-example

This project uses data from the following five TCGA projects 
available from the [National Cancer Institute's Genomic Data Commons](https://gdc.cancer.gov):
- BRCA (Breast cancer)
- KIRC (Kidney renal clear cell carcinoma)
- COAD (Colon adenocarcinoma)
- LUAD (Lung adenocarcinoma)
- PRAD (Prostate adenocarcinoma)

The scripts described below download and compile RNAseq (genome-wide gene expression)
data using the package `TCGAbiolinks`:
- `data_compile.R`: downloads and compiles data from TCGA via NCI-GDC
- `data_filter.R`: suggestions for filtering the data to allow clustering of cancer types and other assessments using machine learning

The resulting data files include:
- `metadata.csv` (not included in this repository): limited clinical and demographic information about all samples (patients) represented by gene expression data,
including an extra column `cancer_type` with the four-letter code for the cancer project
- `genes.csv` (not included in this repository): genome-wide gene expression values,
harmonized and represented as FPKM-UQ.
- `*genes.csv`: data from `genes.csv` subset into individual cancer projects,
with `*` representing the four-letter code for the cancer project

If you are not able to run the scripts,
the files (in csv format) resulting from these scripts are available [here](https://www.dropbox.com/sh/jke9h4km90ner9l/AAD1UyucvlXIFbKTjl-D15U6a?dl=0).

The dataset created by these scripts was inspired by [these data](https://archive.ics.uci.edu/ml/datasets/gene+expression+cancer+RNA-Seq#)
from the [UC Irvine Machine Learning Repository](https://archive.ics.uci.edu/ml/index.php).
