close all; clc;

load("datasets/Circle.mat");
% X = synthetic_dataset(42);
% load("datasets/Spiral.mat");
% X = X(:, 1:2);

% Compute the Laplacian matrix
sigma = 1;
k = 10;
[L, D, W, L_sym] = compute_laplacian(X, sigma, k);

rng("default");

M = 20;

% utilizzando la matrice piena si fa prima
% tempi molto strani per alcuni autovalori visti usando tic; toc; nella
% funzione
exact = eigs(L, M, 'smallestabs')
res = deflation_eigenvalues(L, M)
% figure(1);
% plot(res, color='red', Marker='o');
% figure(2);
% plot(exact, color='blue', Marker='o');

