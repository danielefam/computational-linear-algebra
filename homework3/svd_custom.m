function [U, S, V] = svd_custom(A, k)
    
    [m, n] = size(A);
    if m < n
        A = A';
    end
    if nargin < 2
        k = size(A, 2);
    end

    [P, B, H] = bidiagonalize(A);
    [U2, S, V2] = bidiagonal_svd(B, k);
    U = P'*U2;
    V = H*V2;

    if m < n
        temp = U;
        U = V;
        V = temp;
    end
end