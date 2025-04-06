# 🌱 TDNAseq and BarSeq Analysis in *Trichoderma atroviride*  
[![Python](https://img.shields.io/badge/Python-3.7+-blue)](https://www.python.org/) [![R](https://img.shields.io/badge/R-4.0+-blue)](https://www.r-project.org/) [![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

This repository contains the **Python and R code** used for the analysis of **TDNAseq and BarSeq data** in *Trichoderma atroviride*.

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


---

## 🔥 Installation

To install the dependencies, use the following commands:

```bash
# Clone the repository
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name

# Create a conda environment
conda env create -f environment.yml
conda activate your-env-name
