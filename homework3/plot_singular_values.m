function [] = plot_singular_values(S, color_name, color)
    if nargin < 2
        color_name = 'grey';
    end
    if nargin < 3
        color = 'blue';
    end

    singular_values = diag(S);
    % set(gcf, 'DefaultAxesFontSize', 15, 'DefaultLegendFontSize', 12,  'Units', 'inches', 'PaperUnits', 'inches', 'PaperSize', [6, 4.5], 'Position', [0, 0, 6, 4], 'PaperPositionMode', 'auto');
    plot(abs(singular_values), DisplayName=color_name, LineWidth=1, Color=color);
    xlabel('i');
    ylabel('|\sigma_i|');
    grid on;
end

