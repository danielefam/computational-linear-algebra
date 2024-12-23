% Load the matrix X
close all;
load("datasets/Circle.mat");

% Compute the Laplacian matrix
sigma = 1;
k = 10;
[L, D, W, L_sym] = compute_laplacian(X, sigma, k);

eigs_computation = @(A) eigs(A, 20, 'smallestabs');
plot_graphs(X, L, W, eigs_computation);

[Bins, binsizes] = conncomp(graph(L));
conncomp_graphs_algorithm = size(binsizes, 2);
disp(['# Connected components (graph algorithm): ', num2str(conncomp_graphs_algorithm)]);
conncomp_rank = size(X, 1) - rank(full(L));
disp(['# Connected components (rank): ', num2str(conncomp_rank)]);

M = 3;
kmeans_plot(X, L, M);