function [idx] = kmeans_plot_oral_exam(X, L, M, name)
    % Function that plots the result of k-means after having applied spectral clustering
    rng(1)
    % Compute the first M eigenvectors of the Laplacian matrix
    [U, ~] = eigs(L, M, 'smallestabs');
    disp(vecnorm(U))
    disp(U)

    if M == 2
        figure;
        scatter(U(:,1), U(:,2), Marker="o")
        title('Points of U')
    end
    
    if M == 3
        for i = 1:M
            figure;
            plot(1:length(U(:,i)), U(:,i), Marker='x')
            title([int2str(i), '-column'])
        end
    end
    % disp(sum(abs(U(:,1)) > 1e-8))

    % Apply k-means to the eigenvectors
    idx = kmeans(U, M);
    
    c=colormap(turbo(M));
    figure;
    set(gcf, 'DefaultAxesFontSize', 20, 'DefaultLegendFontSize', 20,  'Units', 'inches', 'PaperUnits', 'inches', 'Position', [0, 0, 4, 4], 'PaperPositionMode', 'auto', 'PaperSize', [4.5, 4.5]);
    
    if size(X, 2) == 3
        for i = 1:M
            scatter3(X(idx==i,1),X(idx==i,2),X(idx==i,3),10,c(i,:),'filled')
            hold on;
        end
    else
        gscatter(X(:,1), X(:,2), idx);
    end

    legend(arrayfun(@(i) num2str(i), 1:M, 'UniformOutput', false));
    hold off;
    saveas(gcf, ['figures/', name, '_c', num2str(M), '.pdf']);
end