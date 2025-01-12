function [mu, v] = inverse_power_method(A, maxIter, relTol)
    if nargin < 2
        maxIter = 500;
    end
    if nargin < 3
        relTol = 1e-8;
    end

    [n,~] = size(A);

    if n == 1
        mu = A;
        v = 1;
        return;
    end

    % Initial gues of the eigenpair
    v_in = sprand(n,1,0.05);
    v_k = v_in / norm(v_in);
    mu_k = 10; 
    
    % LU factorization of A to solve the linear system faster
    [L, U] = lu(A);

    for k = 1:maxIter
        % Solve the linear system
        v_til_k1 = U \ (L \ v_k);     
        
        % Eigenpair update
        mu_k1 = v_k' * v_til_k1;
        v_k1 = v_til_k1 / norm(v_til_k1);

        % Check convergence
        if abs(mu_k1 - mu_k) < relTol * abs(mu_k1)
            break;
        end

        % Update the eigenpair
        v_k = v_k1;
        mu_k = mu_k1;        
    end

    % Output the eigenpair
    mu = 1 / mu_k;
    v = v_k/norm(v_k);
end