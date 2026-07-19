# Homework 3: SVD and Image Compression

A MATLAB project on singular-value decomposition, Householder bidiagonalization, and low-rank image compression.

## Highlights

- Implements Householder transformations and matrix bidiagonalization.
- Builds a custom SVD workflow from bidiagonal form.
- Compresses grayscale and color images with truncated SVD.
- Studies the trade-off between retained rank, compression ratio, and reconstruction error.
- Compares SVD-based compression with a Discrete Cosine Transform (DCT) baseline.

## Quick Start

From this directory, run:

```matlab
main
```

The main script loads the images in `data/`, creates compression results for several rank values, and pauses between image sets. Outputs are written under `figures/`.

## Focused Analyses

| Script | Purpose |
| --- | --- |
| `effect_k_plots.m` | Plots how rank $k$ affects compression ratio and reconstruction error. |
| `dct_comparison.m` | Compares truncated SVD compression against DCT compression. |
| `plot_singular_values.m` | Visualizes singular values. |
| `plot_cumulative_explained_variance.m` | Shows accumulated explained variance. |
| `noise_image_generator.m` | Creates noisy test images. |

## Core Implementation

| File | Role |
| --- | --- |
| `householder_mat.m` | Householder reflection construction. |
| `bidiagonalize.m` | Bidiagonal reduction of a matrix. |
| `bidiagonal_svd.m` | SVD computation from bidiagonal form. |
| `svd_custom.m` | Custom SVD entry point. |
| `compression.m` | Truncated-SVD image compression workflow. |
| `dct_compression.m` | DCT-based image-compression baseline. |

## Requirements

- MATLAB
- Image Processing Toolbox for `immse`, used by the error-analysis scripts

The `Fama_Perlo_HW3/` directory contains a submission-ready copy of this assignment.