function [Q,R] = householder(X)
    [m, n] = size(X);

    if m ~= n
        disp('MATRIX IS NOT SQUARE!');
        Q = []; 
        R = [];
        return;
    end

    % Inizializzazione delle matrici
    R = X;
    Q = eye(n);

    for j = 1:n
        Px = householder_mat(R(j:end, j));
        Pj = eye(n);
        Pj(j:end, j:end) = Px;

        % Aggiornamento delle matrici
        R = Pj * R;
        Q = Pj * Q;
    end

end

