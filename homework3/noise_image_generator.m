function [img] = noise_image_generator(row, col)
    
    if nargin < 2
        col = 640;
    end

    if nargin < 1
        row = 427;
    end

    img = randi([0, 255], row, col);
    img = uint8(img);
    imshow(img);
    imwrite(img, 'data/noise.jpg');    
end