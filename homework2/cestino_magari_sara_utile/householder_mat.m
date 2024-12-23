function [Px] = householder_mat(x)
    if isrow(x)
        x = x';
    end

    % Calcolo del valore sigma
    sigma = sign(x(1)) * norm(x);

    % Calcolo del versore u
    u = x + sigma * eye(length(x), 1);
    u = u / norm(u);

    % Calcolo della matrice di riflessione
    Px = eye(length(x)) - 2 * (u * u');
end

