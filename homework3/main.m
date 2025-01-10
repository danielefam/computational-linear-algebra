close all; clear all; clc;
img_valentine = imread('data/valentino.jpg');
img_bricks = imread('data/bricks.jpg');
img_noise = imread('data/noise.jpg');

imgs = {img_valentine, img_bricks, img_noise};
names = {'Valentino Castle', 'Bricks', 'Noise'};
report_names = {'valentino', 'bricks', 'noise'};

ks = {[5, 10, 15], [2, 10], [3, 10]};

for i = 1:length(imgs)
    name = names{i};
    report_name = report_names{i};
    img = imgs{i};
    k = ks{i};

    disp(name)
    compression(img, k, name, report_name);

    if i ~= length(imgs)
        disp('Press any key to continue');
        pause; 
        close all;
    end
end

disp('Press any key to close all figures');
pause; 
close all;