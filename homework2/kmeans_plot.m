function [idx] = kmeans_plot(X, L, M, name)
    rng(1)
    [U, ~] = eigs(L, M, 'smallestabs');
    
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