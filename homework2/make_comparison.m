function make_comparison(X, output_filename, k, epsilon, minPts)
% K-means clustering
[idx_kmeans, ~] = kmeans(X, k);

% DBSCAN clustering
if nargin < 4 || isempty(epsilon)
    epsilon = 0.5; % Default epsilon value
end
if nargin < 5 || isempty(minPts)
    minPts = 5; % Default minPts value
end
[idx_dbscan, ~] = dbscan(X, epsilon, minPts);

% Plot results
figure;

% K-means plot
subplot(1, 2, 1);
c=colormap(turbo(k));
if size(X, 2) == 3
    for i = 1:k
        scatter3(X(idx_kmeans == i, 1), X(idx_kmeans == i, 2), X(idx_kmeans == i, 3), 10, c(i,:), 'filled');
        hold on;
    end
    legend(arrayfun(@(i) num2str(i), 1:k, 'UniformOutput', false));
else
    gscatter(X(:,1), X(:,2), idx_kmeans);
end
hold on;
title('K-means Clustering');
hold off;

% DBSCAN plot
subplot(1, 2, 2);
c=colormap(turbo(max(idx_dbscan)));
if size(X, 2) == 3
    scatter3(X(:,1), X(:,2), X(:,3), 10, idx_dbscan, 'filled');
    unique_clusters = unique(idx_dbscan);
    for i = 1:length(unique_clusters)
        cluster = unique_clusters(i);
        if cluster == -1
            scatter3(X(idx_dbscan == cluster, 1), X(idx_dbscan == cluster, 2), X(idx_dbscan == cluster, 3), 10, 'k', 'DisplayName', 'Noise');
        else
            scatter3(X(idx_dbscan == cluster, 1), X(idx_dbscan == cluster, 2), X(idx_dbscan == cluster, 3), 10, c(cluster,:), 'filled', 'DisplayName', num2str(cluster));
        end
        hold on;
    end
else
    gscatter(X(idx_dbscan ~= -1, 1), X(idx_dbscan ~= -1, 2), idx_dbscan(idx_dbscan ~= -1));
    hold on;
    scatter(X(idx_dbscan == -1, 1), X(idx_dbscan == -1, 2), 10, 'k', 'DisplayName', 'Noise');
end
legend;
title('DBSCAN Clustering');

% Save the figure as a PDF
saveas(gcf, output_filename, 'pdf');
end