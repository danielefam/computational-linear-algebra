function [Px] = householder_mat(x)

    % Transpose the vector if it is a row vector
    if isrow(x)
        x = x';
    end
    
    % Compute the Householder matrix
    sigma = sign(x(1)) * norm(x);    
    u = x + sigma * eye(length(x), 1);
    u = u / norm(u);   
    Px = eye(length(x)) - 2 * (u * u');
end

