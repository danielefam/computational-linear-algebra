function [] = knn_distances(Xs, k, names)

figure;
set(gcf, 'Units', 'inches', 'PaperUnits', 'inches', 'PaperSize', [6, 5.5], 'Position', [0, 0, 6, 5], 'PaperPositionMode', 'auto');
hold on;
for i = 1:size(Xs, 2)
    X = Xs{i};
    name = names{i};
    distances = pdist2(X, X);
    sorted_distances = sort(distances, 2);
    k_distances = sorted_distances(:, k+1);
    
    num_points = length(k_distances);
    x = (1:num_points) / num_points;

    plot(x, sort(k_distances), 'DisplayName', name);
end
legend;
xlabel('Normalized Points');
ylabel(sprintf('%d-NN Distance', k));
hold off;
saveas(gcf, 'figures/knn_distance_graph.pdf');
end