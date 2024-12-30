clear all; close all; clc;
% Load Circle.mat and Spiral.mat
circle_ds = load('datasets/Circle.mat');
X_circle = circle_ds.X;
spiral_ds = load('datasets/Spiral.mat');
X_spiral = spiral_ds.X(:, 1:2);

% Generate synthetic dataset with random seed 42
X_synthetic = synthetic_dataset(42);

% Evaluate eps for DBSCAN using the k-NN method
k = 4; % Number of nearest neighbors

distances_circle = pdist2(X_circle, X_circle);
sorted_distances_circle = sort(distances_circle, 2);
k_distances_circle = sorted_distances_circle(:, k+1);

distances_spiral = pdist2(X_spiral, X_spiral);
sorted_distances_spiral = sort(distances_spiral, 2);
k_distances_spiral = sorted_distances_spiral(:, k+1);

distances_synthetic = pdist2(X_synthetic, X_synthetic);
sorted_distances_synthetic = sort(distances_synthetic, 2);
k_distances_synthetic = sorted_distances_synthetic(:, k+1);


% Plot the k-distance graph
num_points_circle = length(k_distances_circle);
num_points_spiral = length(k_distances_spiral);
num_points_synthetic = length(k_distances_synthetic);

x_circle = (1:num_points_circle) / num_points_circle;
x_spiral = (1:num_points_spiral) / num_points_spiral;
x_synthetic = (1:num_points_synthetic) / num_points_synthetic;

figure;
hold on;
plot(x_circle, sort(k_distances_circle), 'DisplayName', 'Circle');
plot(x_spiral, sort(k_distances_spiral), 'DisplayName', 'Spiral');
plot(x_synthetic, sort(k_distances_synthetic), 'DisplayName', 'Synthetic');
xlabel('Normalized Points');
ylabel(sprintf('%d-NN Distance', k));
title('k-NN Distance Graph for DBSCAN');
legend;
hold off;
saveas(gcf, 'figures/knn_distance_graph.pdf');

% Call make_comparison with the datasets
make_comparison(X_circle, 'figures/circle_comparison.pdf', 3, 0.7);
make_comparison(X_spiral, 'figures/spiral_comparison.pdf', 3, 2);
make_comparison(X_synthetic, 'figures/synthetic_comparison.pdf', 9, 4.5);