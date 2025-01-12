function [mu, v] = inverse_power_method(A, maxIter, relTol)
    if nargin < 2
        maxIter = 500;
    end
    if nargin < 3
        relTol = 1e-8;
    end

    [n,~] = size(A);
    v_in = sprand(n,1,0.2);

    v_k = v_in / norm(v_in);
    mu_k = 10; 
    % A = full(A);
    [L, U] = lu(A);

    for k = 1:maxIter
        v_til_k1 = U \ (L \ v_k);
        % v_til_k1 = A \ v_k;        
        
        mu_k1 = v_k' * v_til_k1;

        v_k1 = v_til_k1 / norm(v_til_k1);

        if abs(mu_k1 - mu_k) < relTol * abs(mu_k1)
            break;
        end

        v_k = v_k1;
        mu_k = mu_k1;
        
    end

    mu = 1 / mu_k;
    v = v_k/norm(v_k);
end