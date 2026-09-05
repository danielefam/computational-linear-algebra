# Homework 2: Spectral Clustering

An implementation-driven study of spectral clustering, graph Laplacians, and iterative eigenvalue methods in MATLAB.

## Highlights

- Builds weighted k-nearest-neighbor graphs from circle, spiral, and synthetic datasets.
- Computes graph Laplacians and analyzes graph connectivity.
- Compares MATLAB's `eigs` routine with inverse iteration plus deflation.
- Uses Laplacian eigenvectors as a representation for k-means clustering.

## Quick Start

Run MATLAB from this directory and execute the main workflow:

```matlab
main
```

The script processes the datasets in `datasets/` and writes plots to `figures/`. Ensure the `figures/` directory exists before running.

## Additional Experiments

| Script | Purpose |
| --- | --- |
| `comparison.m` | Compares the eigenvalue-computation approaches. |
| `main_lsym.m` | Runs an alternative symmetric-normalized-Laplacian workflow. |
| `main_oral_exam.m` | Contains the oral-exam experiment entry point. |
| `make_comparison.m` | Produces comparison visualizations. |

## Main Components

| File | Role |
| --- | --- |
| `knn_distances.m` | k-nearest-neighbor distance computation. |
| `compute_laplacian.m` | Dense graph-Laplacian construction. |
| `compute_laplacian_sparse.m` | Sparse graph-Laplacian construction. |
| `inverse_power_method.m` | Inverse power iteration. |
| `deflation_eigenvalues.m` | Repeated eigenvalue extraction with deflation. |
| `kmeans_plot.m` | Spectral embedding and clustering plots. |

## Requirements

- MATLAB
- Statistics and Machine Learning Toolbox for `kmeans`
- A recent MATLAB release with graph functions such as `graph` and `conncomp`

## Authors

- **Daniele Famà**
- **Alessandro Perlo**

Politecnico di Torino — *Computational Linear Algebra* (A.Y. 2024/2025)

The `Fama_Perlo_HW2/` folder retains a submission-ready copy of the project prepared by Daniele Famà and Alessandro Perlo.