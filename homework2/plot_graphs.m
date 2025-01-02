function [] = plot_graphs(X, L, W, eigs_computation_fns, name, k, fn_names, markers)
    figure;
    set(gcf, 'DefaultAxesFontSize', 20, 'DefaultLegendFontSize', 20,  'Units', 'inches', 'PaperUnits', 'inches', 'Position', [0, 0, 4, 4], 'PaperPositionMode', 'auto', 'PaperSize', [4.5, 4.5]);
    spy(W);
    xlabel('j')
    ylabel('i')
    saveas(gcf, ['figures/', name, '_knn_k_', num2str(k), '.pdf']);
    figure;
    set(gcf, 'DefaultAxesFontSize', 20, 'DefaultLegendFontSize', 20,  'Units', 'inches', 'PaperUnits', 'inches', 'Position', [0, 0, 4, 4], 'PaperPositionMode', 'auto', 'PaperSize', [4.5, 4.5]);
    if size(X, 2) == 3
        scatter3(X(:,1), X(:,2), X(:,3), 10, 'filled');
    else
        scatter(X(:,1), X(:,2), 10, 'filled');
    end
    saveas(gcf, ['figures/', name, '_dataset.pdf']);
    figure;
    set(gcf, 'DefaultAxesFontSize', 15, 'DefaultLegendFontSize', 12,  'Units', 'inches', 'PaperUnits', 'inches', 'PaperSize', [6, 4.5], 'Position', [0, 0, 6, 4], 'PaperPositionMode', 'auto');
    hold on;
    for i = 1:length(eigs_computation_fns)
        eigs_computation = eigs_computation_fns{i};
        fn_name = fn_names{i};
        marker = markers{i};
        [~, D] = eigs_computation(L);
        D = diag(D);
        plot(abs(D), Marker=marker, DisplayName=fn_name);
    end
    xlabel('i')
    ylabel('|\lambda_i|')
    legend(Location='northwest');
    hold off;
    saveas(gcf, ['figures/', name, '_eigvals.pdf']);
end