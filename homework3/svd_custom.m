function [U, S, V] = svd_custom(A, k)
    
    [m, n] = size(A);
    % Transpose A if it is fat
    if m < n
        A = A';
    end

    if nargin < 2
        k = size(A, 2);
    end

    % Bidiagonalize A
    [P, B, H] = bidiagonalize(A);

    % Compute the SVD of the bidiagonal matrix B
    [U2, S, V2] = bidiagonal_svd(B, k);

    % Compute the SVD of A
    U = P'*U2;
    V = H*V2;

    % Transpose U and V if A is fat
    if m < n
        temp = U;
        U = V;
        V = temp;
    end
end