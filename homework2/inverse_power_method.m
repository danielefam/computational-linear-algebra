function [mu, v] = inverse_power_method(A, maxIter, relTol)
    if nargin < 2
        maxIter = 1000;
    end
    if nargin < 3
        relTol = 1e-6;
    end

    % Normalizzazione iniziale del vettore
    [n,~] = size(A);
    v_k = rand(n,1);
    v_k = v_k / norm(v_k);
    mu_k = 10; % Valore iniziale per mu_k

    for k = 1:maxIter
        % Risoluzione del sistema lineare
        v_til_k1 = linsolve(A, v_k);
        
        % l'implementazione dell'householder è stata inutile ma ormai c'era:
        % X = linsolve(A,B) solves the linear system AX = B using one of these methods:
        % When A is square, linsolve uses LU factorization with partial pivoting.
        % For all other cases, linsolve uses QR factorization with column pivoting.

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
    v = v_k;
end


