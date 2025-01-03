function [Q,R] = householder(X)
    [m, n] = size(X);

    if m < n
        disp('MATRIX IS NOT GOOD!');
        Q = []; 
        R = [];
        return
    end  

    % Inizializzazione delle matrici
    R = X;
    Q = eye(m);

    for j = 1:n
        Pj = householder_mat(R(j:end, j));
        P = eye(m);
        P(j:end, j:end) = Pj;

        % Aggiornamento delle matrici
        R = P * R;
        Q = P * Q;
    end
    Q = Q';

end

