function compression(img, k)
    % Read and convert the image to greyscale
    if ndims(img) == 3
        greyscale_img = rgb2gray(img);
    else
        greyscale_img = img;
    end
    figure;
    imshow(greyscale_img);
    title('Original Greyscale Image');

    % Compress the greyscale image
    [U, S, V] = svd_custom(double(greyscale_img), k);
    img_compressed = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';

    figure;
    imshow(uint8(img_compressed));
    title(['Compressed Greyscale Image with k = ', num2str(k)]);

    if ndims(img) == 2
        return
    end

    % Compress the color image
    img_color = img;
    img_compressed_color = zeros(size(img_color));
    figure;
    imshow(img_color);
    title('Original Color Image');

    for channel = 1:3
        img_channel = double(img_color(:,:,channel));
        [U, S, V] = svd_custom(img_channel, k);
        img_compressed_channel = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
        img_compressed_color(:,:,channel) = img_compressed_channel;
    end

    figure;
    imshow(uint8(img_compressed_color));
    title(['Compressed Color Image with k = ', num2str(k)]);
end