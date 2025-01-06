function [] = plot_cumulative_explained_variance(singular_values, img_title, colors_names, colors)
    if nargin < 3
        colors_names = {'grey'};
    end
    if nargin < 4
        colors = {'b'};
    end

    explained_variance = cumsum(singular_values);
    explained_variance = explained_variance ./ explained_variance(end);

    if size(explained_variance,2) == 1
        color_name = colors_names{1};
        color = colors{1};
        figure;
        % set(gcf, 'DefaultAxesFontSize', 15, 'DefaultLegendFontSize', 12,  'Units', 'inches', 'PaperUnits', 'inches', 'PaperSize', [6, 4.5], 'Position', [0, 0, 6, 4], 'PaperPositionMode', 'auto');
        plot(abs(explained_variance), DisplayName=color_name, LineWidth=1, Color=color);
        xlabel('i');
        ylabel('|\sigma_i|');
        title(img_title);
        grid on;
        return 
    end

    figure;
    hold on;
    for j = 1:length(colors)    
        color_name = colors_names{j};
        color = colors{j};
        plot(abs(explained_variance(:,j)), DisplayName=color_name, LineWidth=1, Color=color);
    end
    title(img_title);  
    xlabel('i');
    ylabel('|\sigma_i|');
    grid on;   
    hold off;
    legend(Location='northeast');
end

