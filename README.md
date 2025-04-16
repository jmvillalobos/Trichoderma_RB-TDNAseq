# 🍄 TDNAseq and BarSeq Analysis in the filamentous fungus *Trichoderma atroviride*  
[![Python](https://img.shields.io/badge/Python-3.7+-blue)](https://www.python.org/) [![R](https://img.shields.io/badge/R-4.0+-blue)](https://www.r-project.org/) [![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

This repository contains the Python and R code used to analyze TDNAseq and BarSeq data in Trichoderma atroviride.

---

## 📌 Overview
This project aims to analyze genetic data from *Trichoderma atroviride* using **TDNAseq** and **BarSeq** techniques. The repository includes:
- Mapping of reads to the genome.

- Annotation of regions containing insertions.

- Counting of barcodes inserted into the genome.

- Calculate the fitness associated with each gene.

- Smear plots of the fitness comparison in R.

---

## 📁 Repository Structure
├── Source             # Original GitHub from **Samuel Coradetti**  
└── LICENSE            # License file  
├── environment.yml    # Conda environment file  
├── scripts/           # Python and R scripts for analysis  
├── results/           # Output figures and statistical results  
├── README.md          # Project documentation  


## 👐 Source of the scripts that we are using in this analysis

The scripts used to perform the RB-TDNAseq analysis, barcode counting, and gene fitness calculation are based on those developed by Samuel Coradetti.

--LICENSE--
Copyright (C) 2019 Samuel Coradetti and the United States Department of Energy. All rights reserved.

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.

Link to Coradetti-Github ([https://www.github.com](https://github.com/stcoradetti/RBseq))
---


## 🔧 Setting Up the Conda Environment for RBTDNAseq
To run this project, you need to set up a Conda environment with all the required packages. Follow the steps below to create, export, and activate the environment.

### 🐍 Prerequisites
Anaconda or Miniconda installed

# 📦 Step-by-Step Installation
1. Create the environment
```bash
conda create -n rbtdnaseq_env python=3.7.6
```
3. Activate the environment
```bash
conda activate rbtdnaseq_env
```
4. Install required packages
```bash
conda install -c defaults -c conda-forge -c bioconda \
  biopython=1.76 \
  numpy=1.18.5 \
  pandas=1.0.5 \
  scipy=1.5.0 \
  matplotlib=3.2.2 \
  statsmodels=0.11.1 \
  blast=2.2.30
```
5. Export the environment (optional but recommended)
After installing everything, export the environment to a YAML file to ensure reproducibility:
```bash
conda env export > tnseq.yml
```
You can version this tnseq.yml file with your repository so others can recreate the exact environment.

🚀 Recreating the Environment from tnseq.yml
To create the same environment on another machine or share it with collaborators:
```bash
conda env create -f tnseq.yml
conda activate rbtdnaseq_env
```
## 🧪 Script Descriptions for RB-TDNAseq analysis
Each script requires a metadata file passed with the -m or --metafile flag. Our metadata files are customized and stored in the metadata directory. **For full details on parameters and file formats, refer to the original repo: stcoradetti/TnSeq-pipeline.**

### RBseq_Map_Insertions.py
This script maps insertion reads from TnSeq experiments to a reference genome using BLAST. It processes barcode structures, identifies junction sequences, filters ambiguous insertions, and creates a dataset of uniquely mapped mutants for downstream analysis.

Inputs:
A metadata file with sample information, read models, insertion sequence details, genome BLAST database path, and annotation files.

Example usage:
```bash
python RBseq_Map_Insertions.py --metafile metadata/my_experiment.tsv
```
Key Outputs:
POOL_poolfile: Mapped, unambiguous insertions.

POOL_poolfile_ambiguous: Barcodes with multiple possible mappings.

TNSEQ_FILE_blastGenome.txt: Raw BLAST hits against the genome.

Log files with detailed processing information.

**See the metadata folder for custom metadata examples.**

### RBseq_Annotate_Insertions.py
This script takes the mapped insertions and annotates them using a GFF file of gene features. It identifies whether insertions fall within coding regions, promoters, or intergenic areas. It also computes several summary statistics to assess biases in insertion site distribution (e.g., GC content, genome features, and scaffold coverage).

Inputs:
A metadata file similar to the one used in RBseq_Map_Insertions.py, pointing to poolfile locations, gene feature files (GeneLocations), and optional annotation mappings (GeneAnnotations).

You can also specify --promoterLength and --terminatorLength to define gene boundaries.

Example usage:
```bash
python RBseq_Annotate_Insertions.py --metafile metadata/my_experiment.tsv
```
Key Outputs:
POOL_poolfile_annotated:
Annotated poolfile including the nearest gene to each insertion and the genomic context (e.g., promoter, exon, intergenic).

POOL_poolfile_GChistogram.pdf:
Histogram showing GC content around insertion sites vs. the overall genome. Helps detect GC bias in insertions.

POOL_poolfile_insertionDistribution.pdf:
Graph showing insertion frequency across promoters, exons, and other features relative to their genome proportion. Useful to detect feature-specific insertion biases.

POOL_poolfile_insertionDistribution.txt:
Raw data used to build the insertion distribution graph.

POOL_poolfile_InsertsPerScaffold.pdf:
Scatterplot comparing number of insertions per scaffold to scaffold size. Helps identify issues in assembly or mapping bias.

POOL_poolfile_LargestScaffold.pdf:
Rolling window graph (1,000 bp) of insertion density across the largest scaffold. Compares actual insertion rates to a predicted "random" distribution model. Useful to check for uniformity and detect potential hot-spots or cold regions.


### RBseq_Count_BarCodes.py
This script processes Illumina fastq files containing barcode sequencing (BarSeq) reads from multiple experimental conditions. It counts the observed barcodes in each sample, using prior mapping and annotation results generated by RBseq_Map_Insertions.py and RBseq_Annotate_Insertions.py. It also computes quality metrics and diversity estimates for the barcode populations.
```bash
python RBseq_Count_Barcodes.py -m metadatafile [-l logfile --matchBefore 6 --matchAfter 6 --qual 10]
```

Inputs:
A metadata file (-m) with the following required columns:

FileIndex: A unique integer ID for each fastq file.

Fastq: Full or relative path to the fastq file.

SampleName: A short unique name for each biological sample (e.g., treatment_a, control_b). Technical replicates should share the same name.

UsePrecounted: TRUE or FALSE. If TRUE, loads previously counted barcodes from the output directory.

Poolfile: Path to the annotated insertion pool file generated by RBseq_Annotate_Insertions.py.

OutputDir: Directory where output files will be saved.

minRandom / maxRandom: Expected range of random leading bases before the barcode in each read.

DualIndex: Expected dual index sequence, if applicable.

BeforeBarcode: Constant sequence before the barcode (used to help locate barcode).

BarcodeLengths: Expected barcode length(s), e.g., 20 or 20,19,21.

AfterBarcode: Constant sequence after the barcode.

Optional arguments:

-l / --logFile: Log file name. Default: Count_TIMESTAMP.log

-q / --qual: Minimum quality score for the barcode region (default: 10)

-b / --matchBefore: Number of bases to match before the barcode (default: 6)

-a / --matchAfter: Number of bases to match after the barcode (default: 6)

-Q / --quietMode: Enables quiet mode (less verbose output)

Outputs:
poolCount.txt: Tab-delimited file summarizing barcode counts per sample, including genomic context from the annotated pool.

countsFiles/: A directory with raw barcode counts per fastq file, including unmatched or unmapped barcodes.

fastqSummaryStats.txt: Summary statistics for each fastq file (e.g., total reads, reads with valid barcodes, Chao diversity estimate).

This script estimates the sequencing error rate based on barcode frequencies and provides a Chao (1987) estimator for the true diversity of barcode sequences. It is especially useful in low-depth datasets.


### RBseq_Calculate_Fitness.py 
This script calculates gene fitness scores from transposon barcode data generated with RBseq_Count_Barcodes.py. It outputs fitness values per gene and statistical tests (T-like stats, Wilcoxon) to help identify genes important under specific conditions.

**Basic usage**
```bash
python RBseq_Calculate_Fitness.py -m fitness_metadata.txt
```
You can add useful options, in our case, because we don´t have a saturate library, we used the parameter minIsertions=1, but you can put even three or more (3 is the default value):
```bash
python RBseq_Calculate_Fitness.py -m fitness_metadata.txt --normLocal 200 --minInsertions 1 --fitnessBrowserOutput
```


**Required input**

-m Metadata file: defines each condition, sample, reference, and associated pool count file (from the previous step).

Pool count files: from RBseq_Count_Barcodes.py.

Minimal metadata columns:

Condition, Sample, Reference, Paired, OutputDir, PoolCountFile

Optional for browser output: SetName, Group, Date, short, etc.

**Key options (optional)**
--normLocal 200: Normalize fitness using local genomic windows (to reduce positional bias).

--minInsertionCounts: Min reads per insertion (default = 3).

--minGeneCounts: Min total reads per gene (default = 20).

--minInsertions: Min insertions per gene (default = 3).

--noPseudoCounts: Disable pseudo-counts (can make results more stringent).

--fitnessBrowserOutput: Generate files compatible with LBNL Fitness Browser.

**Output files (in OutputDir/)**
geneFit.txt: Fitness per gene (average across replicates)

Tstats.txt / pVals.txt: T-like stats and corrected p-values

pVals_Wilcoxon.txt: Conservative non-parametric test

strainFit.txt: Fitness score per insertion

specificPhenotypes.txt: Genes with high fitness effect

qualityStats.txt: Summary QC metrics per condition

QCplots/: Diagnostic plots for each condition:

Fitness vs position

Correlation between gene halves

GC correlation

QQ-plots of T-stats

## More details?
See full documentation and updates at the original repository:
🔗 https://bitbucket.org/berkeleylab/feba


# 📊 R Analysis
We use R and the ggplot2 package to visualize genetic fitness data. If you don't have ggplot2 installed, you can install it in an R session with:

```r
install.packages("ggplot2")
```
### Description
The R scripts used for plotting are located in the scripts_R directory.

We calculate the mean genetic fitness across three biological replicates for each experimental condition. Using ggplot2, we generate scatterplots that compare two conditions to identify the most contrasting fitness profiles.

In each scatterplot, the red dots represent genes whose fitness significantly changes when compared to the reference condition.

For **carbon source comparisons** (e.g., fructose vs. xylose), the reference condition is glucose.

For **nitrogen source comparisons**, the reference is minimal medium supplemented with the 20 essential amino acids (Dropout mix).

These visualizations help to highlight condition-specific gene fitness effects.


