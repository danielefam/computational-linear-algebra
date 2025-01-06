close all; clear all; clc;
img_valentine = imread('data/valentino.jpg');
img_bricks = imread('data/bricks.jpg');
img_noise = imread('data/noise.jpg');

imgs = {img_valentine, img_bricks, img_noise};
names = {'Valentino Castle', 'Bricks', 'Noise'};

k = 10;

for i = 1:length(imgs)
    name = names{i};
    img = imgs{i};
    disp(name)
    compression(img, k, name);

    if i ~= length(imgs)
        disp('Press any key to continue');
        pause; 
        close all;
    end
end