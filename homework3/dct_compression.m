function [compressed_img, compression_ratio, mse] = dct_compression(img, blocksize, k)

% Compute the DCT matrix
T = dctmtx(blocksize);
dct = @(block_struct) T * block_struct.data * T';
B = blockproc(img, [blocksize blocksize], dct);

% Create the mask for the DCT coefficients
mask = zeros(blocksize, blocksize);
tmp = triu(ones(k, k));
tmp = tmp(:, end:-1:1);
mask(1:k, 1:k) = tmp;

% Compute the compression ratio
nonzero_coeffs = nnz(mask);
total_coeffs = numel(mask);
compression_ratio = total_coeffs / nonzero_coeffs;

% Apply the mask to the DCT coefficients
B2 = blockproc(B,[blocksize blocksize],@(block_struct) mask .* block_struct.data);
% Compute the inverse DCT to get the compressed image
invdct = @(block_struct) T' * block_struct.data * T;
compressed_img = blockproc(B2,[blocksize blocksize],invdct);

% Compute the mean squared error
mse = immse(img, compressed_img);

end