function [mu, v] = inverse_power_method(A, maxIter, relTol)
    if nargin < 2
        maxIter = 500;
    end
    if nargin < 3
        relTol = 1e-8;
    end

    % Normalizzazione iniziale del vettore
    [n,~] = size(A);
    v_in = sprand(n,1,0.2);

    v_k = v_in / norm(v_in);
    mu_k = 10; % Valore iniziale per mu_k
    % A = full(A);

    for k = 1:maxIter
        % Risoluzione del sistema lineare        
        % v_til_k1 = linsolve(A , v_k);
        % non posso usare linsolve ad una matrice sparsa
        v_til_k1 = A \ v_k;
        
        
        % Calcolo di mu
        mu_k1 = v_k' * v_til_k1;

        % Normalizzazione di v_til_k1
        v_k1 = v_til_k1 / norm(v_til_k1);

        % Controllo della convergenza
        if abs(mu_k1 - mu_k) < relTol * abs(mu_k1)
            break;
        end

        % Aggiornamento delle variabili
        v_k = v_k1;
        mu_k = mu_k1;
        
    end

    % Output dell'autovalore inverso e autovettore
    mu = 1 / mu_k;
    v = v_k/norm(v_k);
end


