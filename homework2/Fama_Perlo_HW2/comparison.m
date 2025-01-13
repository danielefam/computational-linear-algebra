clear all; close all; clc;

% Load Circle.mat and Spiral.mat
circle_ds = load('datasets/Circle.mat');
X_circle = circle_ds.X;
spiral_ds = load('datasets/Spiral.mat');
X_spiral = spiral_ds.X(:, 1:2);
% Generate synthetic dataset with random seed 42
X_synthetic = synthetic_dataset(42);

Xs = {X_circle, X_spiral, X_synthetic};
names = {"circle", "spiral", "synthetic"};

% Evaluate eps for DBSCAN using the k-NN method
k = 4;
knn_distances(Xs, k, names);

% Set the parameters for the clustering algorithms
params_k = {3, 3, 9};
params_eps = {0.7, 2, 4.5};
% Compare the clustering results for the three datasets
make_comparison(Xs, "figures/comparison_", params_k, params_eps, names);