function [X, D] = deflation_eigenvalues(A, iter)
% ~
    X = zeros(size(A, 1), iter);
    [n, ~] = size(A);

    if n < iter
        iter = n;
    end

    eigvalues = zeros(iter, 1);
    Ak = A;

    for i = 1:iter   
        j = i - 1;
        nk = n - j;

        
        [eigvalues(i), x] = inverse_power_method(Ak);
        
        Ink = speye(nk);

        norm_x = 2*( 1 + x(1) );

        x(1) = x(1) + 1;
        aux = x * x';        
        
        Pk = Ink - 2 * aux/norm_x;
        
        B1k = Pk * Ak * Pk;
        
        Ak = B1k(2:end, 2:end);
        
    end
    D = diag(eigvalues);
end