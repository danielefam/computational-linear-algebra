function compression(img, ks, name)

    max_k = max(ks);
    number_of_channel = 3;
    channel_name_colors = {'Red', 'Green', 'Blue'};
    channel_colors = {'r', 'g', 'b'};
    % Read and convert the image to greyscale
    if ndims(img) == 3
        greyscale_img = rgb2gray(img);
    else
        greyscale_img = img;
    end
    
    show_image(greyscale_img, ['Original Greyscale ', name , ' image']);

    % Compress the greyscale image
    [U, S, V] = svd_custom(double(greyscale_img), max_k);    
    
    plot_singular_values(diag(S), ['Greyscale ', name, ' image singular values']);
    plot_cumulative_explained_variance(diag(S), ['Greyscale ', name, ' image explained variance']);

    for i = 1:length(ks)
        k = ks(i);
        img_compressed = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
        show_image(uint8(img_compressed), ['Compressed Greyscale ', name, ' image with k = ', num2str(k)]);
    end

    if ndims(img) == 2
        return
    end

    % % Compress the color image
    img_color = img;
    img_compressed_color = zeros(size(img_color));
    
    show_image(img_color, ['Original ' , name, ' image'])

    channel_decomposition = cell(1, number_of_channel);
    
    for channel = 1:number_of_channel 
        img_channel = double(img_color(:,:,channel));
        [U, S, V] = svd_custom(img_channel, max_k);
        channel_decomposition{channel} = {U, S, V};
        singular_values(:, channel) = diag(S);
    end

    plot_singular_values(singular_values, ['Colorscale ', name, ' image singular values'], channel_name_colors, channel_colors)
    plot_cumulative_explained_variance(singular_values, ['Colorscale ', name, ' image explained variance'], channel_name_colors, channel_colors)

    for i = 1:length(ks)
        k = ks(i);        
        for channel = 1:number_of_channel
            U = channel_decomposition{channel}{1};
            S = channel_decomposition{channel}{2};
            V = channel_decomposition{channel}{3};

            img_compressed_channel = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
            img_compressed_color(:,:,channel) = img_compressed_channel;
        end
        show_image(uint8(img_compressed_color), ['Compressed ', name,' image with k = ', num2str(k)]);
    end
    
end