function [img] = noise_image_generator(row, col)
    
    if nargin < 2
        col = 640;
    end

    if nargin < 1
        row = 427;
    end

    % Generate a matrix of random integers between 0 and 255 
    img = randi([0, 255], row, col);

    % Convert the matrix to an image and display it
    img = uint8(img);
    imshow(img);
    imwrite(img, 'data/noise.jpg');    
end