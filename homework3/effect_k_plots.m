close all; clear all; clc;
% 'immse' requires Image Processing Toolbox 
img_valentine = rgb2gray(imread('data/valentino.jpg'));
img_bricks = rgb2gray(imread('data/bricks.jpg'));
img_noise = imread('data/noise.jpg');

[m, n, ~] = size(img_valentine);
k_max = min(m, n);

imgs = {img_valentine, img_bricks, img_noise};
names = {'Valentino Castle', 'Bricks', 'Noise'};
names_for_report = {'valentino', 'bricks', 'noise'};
decompositions = cell(1, length(imgs));

for i = 1:length(imgs)
    name = names{i};
    img = im2double(imgs{i});
    disp(name)
    % Compute the SVD decomposition of the image
    tic;
    [U, S, V] = svd_custom(img);
    decompositions{i} = {U, S, V};
    toc;
end

compression_ratio = zeros(k_max, 1);
mse = zeros(k_max, length(imgs));

for i = 1:length(imgs)
    img = imgs{i};
    U = decompositions{i}{1};
    S = decompositions{i}{2};
    V = decompositions{i}{3};
    for k = 1:k_max
        compression_ratio(k) = (m*n)/(k*(m+n+1));
        img_compressed = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
        % 'immse' requires Image Processing Toolbox 
        mse(k, i) = immse(im2double(img), img_compressed);
    end
end

figure;
plot(1:k_max, compression_ratio);
hold on;
yline(1, 'r');
set(gca, 'YScale', 'log');

figure;
plot(1:k_max, mse);
legend(names);