function [] = plot_cumulative_explained_variance(singular_values, img_title, colors_names, colors, img_report_name)
    if nargin < 3
        colors_names = {'grey'};
    end
    if nargin < 4
        colors = {'b'};
    end
    if nargin < 5
        img_report_name = img_title;
    end

    singular_values = singular_values.^2/(size(singular_values,1)-1);
    explained_variance = cumsum(singular_values);
    explained_variance = explained_variance ./ explained_variance(end, :);

    if size(explained_variance,2) == 1
        color_name = colors_names{1};
        color = colors{1};
        figure;
        set(gcf, 'DefaultAxesFontSize', 15, 'DefaultLegendFontSize', 12,  'Units', 'inches', 'PaperUnits', 'inches', 'PaperSize', [6, 4.5], 'Position', [0, 0, 6, 4], 'PaperPositionMode', 'auto');
        plot(abs(explained_variance), DisplayName=color_name, LineWidth=1, Color=color);
        xlabel('i');
        ylabel('cumulative explained variance');        
        grid on;
        saveas(gcf, ['figures/', img_report_name, '.pdf']);
        title(img_title);
        return 
    end

    figure;
    set(gcf, 'DefaultAxesFontSize', 15, 'DefaultLegendFontSize', 12,  'Units', 'inches', 'PaperUnits', 'inches', 'PaperSize', [6, 4.5], 'Position', [0, 0, 6, 4], 'PaperPositionMode', 'auto');
    hold on;
    for j = 1:length(colors)    
        color_name = colors_names{j};
        color = colors{j};
        plot(abs(explained_variance(:,j)), DisplayName=color_name, LineWidth=1, Color=color);
    end     
    xlabel('i');
    ylabel('cumulative explained variance');
    grid on;   
    hold off;
    legend(Location='northeast');
    saveas(gcf, ['figures/', img_report_name, '.pdf']);
    title(img_title); 
end

