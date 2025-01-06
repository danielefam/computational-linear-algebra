function compression(img, k, name)
    
    channel_name_color = {'Red', 'Green', 'Blue'};
    channel_color = {'r', 'g', 'b'};
    % Read and convert the image to greyscale
    if ndims(img) == 3
        greyscale_img = rgb2gray(img);
    else
        greyscale_img = img;
    end
    
    show_image(greyscale_img, ['Original Greyscale ', name , ' image']);

    % Compress the greyscale image
    [U, S, V] = svd_custom(double(greyscale_img), k);

    figure;
    plot_singular_values(S)
    title(['Greyscale ', name, ' image singular values'])

    img_compressed = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';

    show_image(uint8(img_compressed), ['Compressed Greyscale ', name, ' image with k = ', num2str(k)])

    if ndims(img) == 2
        return
    end

    % Compress the color image
    img_color = img;
    img_compressed_color = zeros(size(img_color));
    
    show_image(img_color, ['Original ' , name, ' image'])

    figure;
    hold on;
    for channel = 1:3
        color_name = channel_name_color{channel};
        color = channel_color{channel};
        img_channel = double(img_color(:,:,channel));
        [U, S, V] = svd_custom(img_channel, k);

        image_title = ['Colorscale ', name, ' image singular values'];
        
        plot_singular_values(S, color_name, color)
        title(image_title);        

        img_compressed_channel = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
        img_compressed_color(:,:,channel) = img_compressed_channel;
    end
    hold off;
    legend(Location='northeast');
   
    show_image(uint8(img_compressed_color), ['Compressed ', name,' image with k = ', num2str(k)]);
end