close all; clear all; clc;

% Load Circle.mat and Spiral.mat
% circle_ds = load('datasets/Circle.mat');
circle_ds = load('datasets/Spiral.mat');
X_circle = circle_ds.X(:, 1:2);
size(X_circle)
Xs = {X_circle};
names = {'circle'};
Ms = {[2, 3]};

for i = 1:length(Xs)
    X = Xs{i};
    name = names{i};
    % Compute the Laplacian matrix
    sigma = 1;
    for k = [20 40]
        [~, ~, W, ~] = compute_laplacian(X, sigma, k);
    end
    k = 10;
    [L, D, W, L_sym] = compute_laplacian(X, sigma, k);

    eigs_computation_fns = {@(A) eigs(A, 20, 'smallestabs')};
    eigs_fns_names = {'eigs Matlab method'};
    markers = {'o'};
    
    [Bins, binsizes] = conncomp(graph(L));
    conncomp_graphs_algorithm = size(binsizes, 2);
    disp([name, ' - # Connected components (graph algorithm): ', num2str(conncomp_graphs_algorithm)]);
    conncomp_rank = size(X, 1) - rank(full(L));
    disp([name ' - # Connected components (rank): ', num2str(conncomp_rank)]);

    for m = Ms{i}
        idx = kmeans_plot_oral_exam(X, L, m, name);
    end
end