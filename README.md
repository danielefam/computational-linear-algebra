# Computational Linear Algebra

<p align="center">
  <strong>Numerical experiments in MATLAB: PCA, spectral clustering, singular-value decomposition, and image compression.</strong>
</p>

<p align="center">
  Coursework collection for the <em>Computational Linear Algebra</em> course at Politecnico di Torino.
</p>

---

## Overview

This repository gathers three hands-on assignments that turn core linear-algebra concepts into reproducible computational experiments. The work combines matrix factorizations, graph-based learning, eigenvalue algorithms, and image processing, with an emphasis on implementing and comparing numerical methods.

| Assignment | Focus | Highlights |
| --- | --- | --- |
| `homework1` | Principal Component Analysis | PCA applied to the Fama-French / Perold dataset, with data and an accompanying notebook. |
| `homework2` | Spectral clustering | k-NN graphs, graph Laplacians, eigensolvers, and clustering experiments on circle and spiral datasets. |
| `homework3` | SVD and compression | Householder bidiagonalization, custom SVD routines, truncated-SVD image compression, noise analysis, and a DCT comparison. |

## Repository Map

```text
.
|-- homework1/   # PCA data and notebook
|-- homework2/   # Spectral clustering and eigenvalue methods
`-- homework3/   # SVD, image compression, and DCT comparison
```

Each assignment contains its own MATLAB entry points, helper functions, datasets, and generated-figure directory. Some folders named `Fama_Perlo_HW*` preserve submission-ready copies of the corresponding work.

## Requirements

- MATLAB (recent release recommended)
- Statistics and Machine Learning Toolbox for clustering-related workflows
- Image Processing Toolbox for the image-quality metric `immse` used in Homework 3
- Python with Jupyter support for the notebook in Homework 1

## Run the Experiments

Start MATLAB in the repository root, then change into the assignment you want to explore.

```matlab
cd homework2
main
```

### Homework 1: PCA

Open and run `HWpca_Fama_Perlo.ipynb`. The CSV files in `homework1/` provide the input data.

### Homework 2: Spectral Clustering

Run `main.m` to execute the assignment workflow and save generated plots to `figures/`. Run `comparison.m` separately to compare the eigenvalue methods.

### Homework 3: SVD and Image Compression

Run `main.m` for the main workflow. The following scripts provide focused analyses:

```matlab
effect_k_plots
dct_comparison
```

Outputs are saved under `figures/`; image-based experiments use the files in `data/`.

## Methods at a Glance

- Principal Component Analysis (PCA)
- k-nearest-neighbor graph construction
- Unnormalized, random-walk, and symmetric graph Laplacians
- Power, inverse-power, shifted inverse-power, and deflation methods
- k-means clustering
- Householder transformations and bidiagonalization
- Truncated singular-value decomposition for image compression
- Discrete Cosine Transform (DCT) baselines

## Notes

This is academic coursework intended for learning, discussion, and reproducibility. The code prioritizes readable numerical implementations alongside the experiments that motivate them.