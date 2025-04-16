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
bash
Copiar
Editar
conda create -n rbtdnaseq_env python=3.7.6
2. Activate the environment
bash
Copiar
Editar
conda activate rbtdnaseq_env
3. Install required packages
bash
Copiar
Editar
conda install -c defaults -c conda-forge -c bioconda \
  biopython=1.76 \
  numpy=1.18.5 \
  pandas=1.0.5 \
  scipy=1.5.0 \
  matplotlib=3.2.2 \
  statsmodels=0.11.1 \
  blast=2.2.30
4. Export the environment (optional but recommended)
After installing everything, export the environment to a YAML file to ensure reproducibility:

bash
Copiar
Editar
conda env export > tnseq.yml
You can version this tnseq.yml file along with your repository so others can recreate the exact environment.

🚀 Recreating the Environment from tnseq.yml
To create the same environment on another machine or share it with collaborators:

bash
Copiar
Editar
conda env create -f tnseq.yml
conda activate rbtdnaseq_env

