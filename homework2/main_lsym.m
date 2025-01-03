close all; clear all; clc;

% Load Circle.mat and Spiral.mat
circle_ds = load('datasets/Circle.mat');
X_circle = circle_ds.X;
spiral_ds = load('datasets/Spiral.mat');
X_spiral = spiral_ds.X(:, 1:2);
% Generate synthetic dataset with random seed 42
X_synthetic = synthetic_dataset(42);

Xs = {X_circle, X_spiral, X_synthetic};
names = {'circle', 'spiral', 'synthetic'};
Ms = {[2, 3, 6], [3, 6], [3, 9]};

for i = 1:length(Xs)
    X = Xs{i};
    name = names{i};
    % Compute the Laplacian matrix
    sigma = 1;
    for k = [20 40]
        [~, ~, W, ~] = compute_laplacian(X, sigma, k);
        figure;
        set(gcf, 'DefaultAxesFontSize', 20, 'DefaultLegendFontSize', 20, 'Units', 'inches', 'PaperUnits', 'inches', 'Position', [0, 0, 4, 4], 'PaperPositionMode', 'auto', 'PaperSize', [4.5, 4.5]);
            spy(W);
        xlabel('j')
        ylabel('i')
        saveas(gcf, ['figures/', name, '_knn_k_', num2str(k), '.pdf']);
    end
    k = 10;
    [L, D, W, L_sym] = compute_laplacian(X, sigma, k);

    eigs_computation_fns = {@(A) eigs(A, 20, 'smallestabs'), @(A) deflation_eigenvalues(full(A), 20)};
    eigs_fns_names = {'eigs Matlab method', 'inverse + deflation method'};
    markers = {'o', 'x'};
    plot_graphs(X, L_sym, W, eigs_computation_fns, name, k, eigs_fns_names, markers);

    [Bins, binsizes] = conncomp(graph(L_sym));
    conncomp_graphs_algorithm = size(binsizes, 2);
    disp([name, ' - # Connected components (graph algorithm): ', num2str(conncomp_graphs_algorithm)]);
    conncomp_rank = size(X, 1) - rank(full(L_sym));
    disp([name ' - # Connected components (rank): ', num2str(conncomp_rank)]);

    for m = Ms{i}
        idx = kmeans_plot(X, L_sym, m, name);
    end
end