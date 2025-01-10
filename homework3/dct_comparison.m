close all; clear all; clc;
img_valentine = rgb2gray(imread('data/valentino.jpg'));
img_bricks = rgb2gray(imread('data/bricks.jpg'));

[m, n, ~] = size(img_valentine);
k_max = min(m, n);

imgs = {img_valentine, img_bricks};
names = {'Valentino Castle', 'Bricks'};
names_for_report = {'valentino', 'bricks'};
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

blocksize = 8;
compression_ratio_dct = zeros(blocksize-1, length(imgs));
mse_dct = zeros(blocksize-1, length(imgs));

compression_ratio_svd = zeros(blocksize-1, length(imgs));
mse_svd = zeros(blocksize-1, length(imgs));
ks_svd = linspace(3, 100, blocksize);
ks_svd = int32(ks_svd);


for i = 1:length(imgs)
    img = imgs{i};
    U = decompositions{i}{1};
    S = decompositions{i}{2};
    V = decompositions{i}{3};
    for k = 2:blocksize
        [compressed_img, compression_ratio_dct(k-1, i), mse_dct(k-1, i)] = dct_compression(im2double(img), blocksize, k);
        show_image(compressed_img, ['DCT Compressed ', names{i}, ' k=', num2str(k)], ['/',names_for_report{i}, '/', names_for_report{i}, '_dct_', '_k_', num2str(k)]);
    end
    for j = 2:blocksize
        k = ks_svd(j);
        img_compressed = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
        compression_ratio_svd(j-1, i) = (m*n)/(k*(m+n+1));
        mse_svd(j-1, i) = immse(im2double(img), img_compressed);
    end
end

figure;
plot(compression_ratio_svd, mse_svd, Marker='x');
svd_legend = arrayfun(@(x) sprintf('SVD %s', names{x}), 1:length(names), 'UniformOutput', false);
hold on;
plot(compression_ratio_dct, mse_dct, Marker='o');
dct_legend = arrayfun(@(x) sprintf('DCT %s', names{x}), 1:length(names), 'UniformOutput', false);
legend([svd_legend dct_legend]);
xlabel('Compression Ratio');
ylabel('Mean Squared Error');
set(gca, 'YScale', 'log');
hold off;