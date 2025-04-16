# 🌱 TDNAseq and BarSeq Analysis in *Trichoderma atroviride*  
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

├── data/ # Raw and processed data files ├── scripts/ # Python and R scripts for analysis ├── results/ # Output figures and statistical results ├── README.md # Project documentation ├── environment.yml # Conda environment file └── LICENSE # License file

## 👐 Source of the scripts that we are using in this analysis

The scripts used to perform the RB-TDNAseq analysis, barcode counting, and gene fitness calculation are based on those developed by Samuel Coradetti.

--LICENSE--
Copyright (C) 2019 Samuel Coradetti and the United States Department of Energy. All rights reserved.

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.

Link to Coradetti-Github ([https://www.ejemplo.com](https://github.com/stcoradetti/RBseq))
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




