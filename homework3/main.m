close all; clear all; clc;
img_valentine = imread('data/valentino.jpg');
img_bricks = imread('data/bricks.jpg');
img_noise = imread('data/noise.jpg');

imgs = {img_bricks, img_noise};
names = {'bricks', 'noise'};

k = 1;

for i = 1:length(imgs)
    disp(names{i})
    img = imgs{i};
    compression(img, k);

    if i ~= length(imgs)
        disp('Press any key to continue');
        pause; 
        close all;
    end
end