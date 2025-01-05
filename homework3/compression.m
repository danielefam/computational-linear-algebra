img = imread('data/valentino.jpg');
greyscale_img = rgb2gray(img);
figure;
imshow(greyscale_img);

k = 10;
[U, S, V] = svd_custom(double(greyscale_img), k);
img_compressed = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
figure;
imshow(uint8(img_compressed));

img_color = img;
img_compressed_color = zeros(size(img_color));
figure;
imshow(img_color);

for channel = 1:3
    img_channel = double(img_color(:,:,channel));
    [U, S, V] = svd_custom(img_channel, k);
    img_compressed_channel = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
    img_compressed_color(:,:,channel) = img_compressed_channel;
end

figure;
imshow(uint8(img_compressed_color));