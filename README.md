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

## 👐 Fuente de los scripts usados

Los scripts utilizados para realizar el analisis de RB-TDNAseq y conteo de barcodes y gene fitness se basan en los desarrollados por Samuel Coradetti.

--LICENSE--
Copyright (C) 2019 Samuel Coradetti and the United States Department of Energy. All rights reserved.

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.

[Link to the Github]([https://www.ejemplo.com](https://github.com/stcoradetti/RBseq))
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
