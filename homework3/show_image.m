function [] = show_image(img, img_title, img_report_name)

    if nargin < 3
        img_report_name = img_title;
    end

    figure;
    set(gcf, 'DefaultAxesFontSize', 15, 'DefaultLegendFontSize', 12,  'Units', 'inches', 'PaperUnits', 'inches', 'PaperSize', [6, 4.5], 'Position', [0, 0, 6, 4], 'PaperPositionMode', 'auto');
    imshow(img);
    imwrite(img, ['figures/', img_report_name, '.jpg']);
    title(img_title);    
end

