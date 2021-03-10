# ml-pancancer-example

This repository includes resources and examples for scientific researchers interested in improving their coding, data analytics, and machine learning skills. These materials are maintained by the training and community team at Fred Hutchinson Cancer Research Center and were develop in collaboration with a team of graduate students in the UW Master's in Data Science (MSDS) program as part of their Capstone project.

This repository focuses on data from the [gene count TCGA Data Set](https://www.dropbox.com/sh/jke9h4km90ner9l/AAD1UyucvlXIFbKTjl-D15U6a?dl=0) and utilizes python as a primary delevolpment tool, but the material and ideas are universal and should be able to transfer to R with the appropriate code changes.

# Directory Structure
```bash
├── ml-pancancer-example
│   ├── .ipynb_checkpoints
│   ├── 1-Data
│   │   ├── README.md
│   │   ├── data_compile.R
│   │   ├── data_filter.R
│   │   ├── ml-genomics.Rproj
│   ├── 2-Tutorials
│   │   ├── Tutorial 1 - Beginner.ipynb
│   │   ├── Tutorial 2 - Intermediate.ipynb
│   │   ├── Tutorial 3 - Expert.ipynb
│   ├── 3-Outputs
│   │   ├── fig1
│   │   ├── fig2
│   │   ├── etc
│   ├── .gitignore
│   ├── LICENSE.md
│   ├── README.md
│   └── requirements.yml
└── .gitignore
```


## Description

**Data Science and Machine Learning with PANCANCER data – example**

This is an introduction to Data Science and Machine Learning techniques focus on three levels of expertise: 

* Beginner
	- Exploratory Data Analysis 
	- General data analytics through python
* Intermediate
	- Statistical background
	- Hypothesis Testing
	- Statistical Simulations
	- Python User Defined Functions
* Advanced
	- General Background Theory in Machine Learning models
	- Techniques for using _Scikit-Learn_ ML models in python
	- Classification and Clustering ML models
	- Model Performance and improvements

The project assumes some knowledge or experience with **python** or **R**,
but will show and walk through the
data analysis process. Each of the tutorials are developed to stand on their own, meaning you could jump into the
tutorial notebook you are interested in, but it is highly encourage to start from the _Beginner_ tutorial and move
through each in progression.

___NOTE:___ The TCGA Data file is too large to host in github. To access the data, please see the Data directory
[README](1-Data/) to know where to download data. Once locally downloaded _data.csv_ and _metadata.csv_, store them
in the "1-Data" local folder to run the code in the tutorials. 

----

# If you want to run these notebooks yourself follow these steps:
## Step 1.
clone this repo

## Step 2.
clone [this](https://github.com/fredhutchio/ml-pancancer-example) repo in the same
directory (i.e., as a sibling directory to this repository).

## Step 3.
Warning! The tutorials make reference to `../../genes.csv` and `../../metadata.csv`, neither available
directly in this repo. You need to go to the [1-Data](https://github.com/fredhutchio/ml-pancancer-example/tree/main/1-Data) 
directory and follow the instruction to download both files locally as they are quite large
to store in this gitrepo.

## Step 4.
Ensure your [environment](https://github.com/fredhutchio/ml-pancancer-example/blob/main/requirements.yml) has
the following package dependencies installed (you can use `pip install` or `conda`):

```
dependencies:
  - altair=4.1.0=py_1
  - jupyter=1.0.0=py37_7
  - jupyter_client=6.1.3=py_0
  - jupyter_console=6.1.0=py_0
  - jupyter_core=4.6.3=py37_0
  - markdown=3.1.1=py37_0
  - matplotlib=3.1.3=py37_0
  - matplotlib-base=3.1.3=py37hef1b27d_0
  - numpy=1.18.1=py37h4f9e942_0
  - numpy-base=1.18.1=py37hde5b4d6_1
  - pandas=1.0.3=py37h0573a6f_0
  - pip=20.0.2=py37_3
  - python=3.7.7=h191fe78_0_cpython
  - python-dateutil=2.8.1=py_0
  - python_abi=3.7=1_cp37m
  - scikit-learn=0.22.1=py37hd81dba3_0
  - scipy=1.4.1=py37h0b6359f_0
  - statsmodels=0.11.1=py37h8f50634_2
  - seaborn==0.11.1

```


## Step 5.
You can now follow along the tutorial. We recommend starting with 
[Tutorial 1 - Beginner](https://github.com/fredhutchio/ml-pancancer-example/blob/main/2-Tutorials/Tutorial%201%20-%20Beginner.ipynb),
as there are some references to some findings in the later tutorials, but you should be
able to follow along with any tutorial you decide to jump into.

----


## _Beginner_ Notebook Tutorial

In this notebook we will work through the process of data analysis for the [gene expression cancer RNA-Seq Data Set](https://archive.ics.uci.edu/ml/datasets/gene+expression+cancer+RNA-Seq#)
and the genomic count data obtained from the [TCGA projects from the National Cancer Institute's Genomic Data Commons](https://www.dropbox.com/sh/jke9h4km90ner9l/AAD1UyucvlXIFbKTjl-D15U6a?dl=0). 
This is the beginner or novice notebook and we will focus on general data cleanup, manipulation, and 
analysis techniques for the _data science process_ in python.

We Focus on:
* Importing Python libraries for data analysis
	- Data Manipulation and Data Processing
		- pandas
		- numpy
	- Data Visualization
		- Matplotlib
		- Seaborn
		- Altair
* Dealing with Data Cleaning and Processing
	- loading dataframes
	- dealing missing or problematic features
	- subsetting data
* Beginner Data Analysis Techniques
	- Exploratory Data Analysis (EDA)
	- Generating Summary Statistics

By the end of the tutorial you will be familiar with dealing with data and creating charts 
for your research and data analysis like these:

![seaborn_fig](3-Outputs/gene_expression_seaborn.png "seaborn")
![altair_fig](3-Outputs/Gene_expression_altair.gif "segment")

## _Intermediate_ Tutorial Notebook

This is the intermediate level notebook for the Data Science (DS) and Machine Learning (ML) FredHutch.io tutorial, where we will work through beginning to end on different aspects and techniques in DS for Statistical Testing in Research and Data Analysis.

In this notebook we will work through the process of data analysis for the [gene count TCGA Data Set](https://www.dropbox.com/sh/jke9h4km90ner9l/AAD1UyucvlXIFbKTjl-D15U6a?dl=0). **We will be using some findings from the Beginner Tutorial Notebook.**

This is the intermediate notebook and we will  focusing specifically on statistical testing and regression models in **python**. We will keep working with *python libraries* introduced in the Beginner Tutorial and introduce some new libraries with special purposes in statistics.
> **Libraries Used in This Tutorial**
* Data Manipulation and Processing
     - [pandas]( https://pandas.pydata.org/)
     - [numpy]( https://numpy.org/)
* Data Visualization
	- [Matplotlib](https://matplotlib.org/)
    - [Seaborn](https://seaborn.pydata.org/)
    - [Altair](https://altair-viz.github.io/)
* Statistics
    - [SciPy](https://www.scipy.org/)
    - [Statsmodels](https://www.statsmodels.org/stable/index.html)


By the end of the tutorial, you will be familiar with dealing with best practices in developing and performing
statistical hypothesis tests for research, how to implement statistical python libraries, and how to interpret results.

## _Expert_ Tutorial Notebook

This is the expert level notebook for the Data Science (DS) and Machine Learning (ML) FredHutch.io tutorial, 
where we will work through beginning to end on different aspects and techniques in DS and ML for Research and Analysis.

In this notebook we will work through Machine Learning techniques and strategies on the 
genes data (datasets available [here](https://www.dropbox.com/sh/jke9h4km90ner9l/AAD1UyucvlXIFbKTjl-D15U6a?dl=0)) 
from the same five cancer types (BRCA, KIRC, COAD, LUAD, PRAD) from the TCGA projects available from the [National Cancer Institute's Genomic Data Commons](https://gdc.cancer.gov/). 

We will keep working with *python libraries* introduced in the Beginner and Intermediate Tutorials and introduce 
some new libraries with special purposes in **Machine Learning**.
> **Libraries Used in This Tutorial**
* Data Manipulation and Processing
     - [pandas]( https://pandas.pydata.org/)
     - [numpy]( https://numpy.org/)
* Data Visualization
	- [Matplotlib](https://matplotlib.org/)
    - [Seaborn](https://seaborn.pydata.org/)
    - [Altair](https://altair-viz.github.io/)
* Statistics
    - [Scipy](https://www.scipy.org/)
    - [Statsmodels](https://www.statsmodels.org/stable/index.html)
* Machine Learning
    - [Scikit-Learn](https://scikit-learn.org/stable/)
    
In this notebook we will be focusing specifically on Machine Learning modeling in **python**. We'll primariy focus in:
* Introducing what Machine Learning is
* Fundamental concepts and techniques in ML
* Introduce and familiarize with using **Scikit-Learn**
* Fundamental categories of models
* Some specific examples with regression and clustering ML models.

By the end of this tutorial you will be familiarized with general theory and concepts for implementing and analyzing
machine learning models in python. You will be able to use the *sklearn* library funtions to analyze data and perform
machine learning models such as:
* Random Forest
![randomforest_fig](3-Outputs/rForest_Decision_space.png "randomforest")

* K-Means
![kmeans_fig](3-Outputs/Kmeans_Cluster.png "kmeans")


## Team

This project was developed by the following team of graduate students in the UW Master's in Data Science (MSDS) program:

- [Andres De La Fuente](https://github.com/Oponn-1)
- [Juan Solorio](https://github.com/JUAN-SOLORIO)
