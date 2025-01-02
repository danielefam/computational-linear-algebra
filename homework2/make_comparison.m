function make_comparison(Xs, output_filename, params_k, params_eps, minPts, algo, names)
for i = 1:size(Xs,2)
    X = Xs{i};
    k = params_k{i};
    epsilon = params_eps{i};
    name = names{i};
    % Prepare the figure
    figure;
    set(gcf, 'Units', 'inches', 'PaperUnits', 'inches', 'Position', [0, 0, 4, 4], 'PaperPositionMode', 'auto', 'PaperSize', [4, 4.5]);

    if algo == "kmeans"
    % K-means clustering
        [idx, ~] = kmeans(X, k);
        % K-means plot
        c=colormap(turbo(k));
        if size(X, 2) == 3
            for j = 1:k
                scatter3(X(idx == j, 1), X(idx == j, 2), X(idx == j, 3), 10, c(j,:), 'filled');
                hold on;
            end
            legend(arrayfun(@(i) num2str(i), 1:k, 'UniformOutput', false));
        else
            gscatter(X(:,1), X(:,2), idx);
        end
    else
        % DBSCAN clustering
        if nargin < 4 || isempty(epsilon)
            epsilon = 0.5; % Default epsilon value
        end
        if nargin < 5 || isempty(minPts)
            minPts = 5; % Default minPts value
        end
        [idx, ~] = dbscan(X, epsilon, minPts);
        % DBSCAN plot
        c=colormap(turbo(max(idx)));
        if size(X, 2) == 3
            scatter3(X(:,1), X(:,2), X(:,3), 10, idx, 'filled');
            unique_clusters = unique(idx);
            for j = 1:length(unique_clusters)
                cluster = unique_clusters(j);
                if cluster == -1
                    scatter3(X(idx == cluster, 1), X(idx == cluster, 2), X(idx == cluster, 3), 10, 'k', 'DisplayName', 'Noise');
                else
                    scatter3(X(idx == cluster, 1), X(idx == cluster, 2), X(idx == cluster, 3), 10, c(cluster,:), 'filled', 'DisplayName', num2str(cluster));
                end
                hold on;
            end
        else
            gscatter(X(idx ~= -1, 1), X(idx ~= -1, 2), idx(idx ~= -1));
            hold on;
            scatter(X(idx == -1, 1), X(idx == -1, 2), 10, 'k', 'DisplayName', 'Noise');
        end
    end
    legend;
    % Save the figure as a PDF
    saveas(gcf, output_filename + name, 'pdf');
end
end