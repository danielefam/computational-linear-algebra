# Homework 1: Principal Component Analysis

Exploration of Principal Component Analysis (PCA) applied to survey response data (`responses_hw.csv`), focusing on data preprocessing, feature selection, dimensionality reduction, and clustering.

## Authors

- **Daniele Famà**
- **Alessandro Perlo**

Politecnico di Torino — *Computational Linear Algebra* (A.Y. 2024/2025)

## Dataset

The analysis is conducted on survey response data (`responses_hw.csv`) accompanied by column descriptions (`columns_hw.csv`). The dataset covers diverse categories including personality traits, interests, music preferences, health habits, and financial spending. A reproducible subset of features and observations is sampled based on student IDs for subsequent analysis.

## Contents

| File | Description |
| --- | --- |
| `HWpca_Fama_Perlo.ipynb` | Main Jupyter notebook containing the analysis and visualizations. |
| `columns_hw.csv` | Feature and column metadata. |
| `responses_hw.csv` | Input observations used by the notebook. |
| `HWpca_Fama_Perlo.pdf` | Exported assignment report. |
| `HW2_PCA.pdf` | Supporting assignment material. |
| `Fama_Perlo_HW1/` | Submission-ready copy of the assignment. |

## Run

Open `HWpca_Fama_Perlo.ipynb` in Jupyter Notebook, JupyterLab, or VS Code and run the cells from top to bottom.

```bash
jupyter notebook HWpca_Fama_Perlo.ipynb
```

## Requirements

A Python environment with Jupyter and the packages imported by the notebook (`numpy`, `pandas`, `scipy`, `scikit-learn`, `matplotlib`). Install any missing dependencies in the selected notebook kernel before running the analysis.

## Goal

The notebook studies the data through principal components, examining dimensionality reduction, explained variance, feature loadings, and clustering in the reduced subspace.