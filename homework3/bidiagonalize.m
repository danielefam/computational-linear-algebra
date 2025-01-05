function [P, B, H] = bidiagonalize(A)
    [m, n] = size(A);

    changed = false;
    if m < n
        A = A';
        [m, n] = size(A);
        changed = true;
    end  

    P = eye(m);
    H = eye(n);
    B = A;
    
    for j = 1:n

        % P*B    
        u = householder_vector(B(j:end, j));

        for k = j:n
            beta = 2 * (u' * B(j:end, k));
            B(j:end, k) = B(j:end, k) - beta * u;
        end

        for k = 1:m
            beta = 2 * (u' * P(j:end, k));
            P(j:end, k) = P(j:end, k) - beta * u;
        end

        
        % B*H
        if j < n - 1
            u = householder_vector(B(j, (j+1):end)');            
            
            for k = 1:m
                beta = 2 * (B(k, (j+1):end) * u);
                B(k, (j+1):end) = B(k, (j+1):end) - beta * u';
            end
            
            
            for k = 1:n
                beta = 2 * (H(k, (j+1):end) * u);
                H(k, (j+1):end) = H(k, (j+1):end) - beta * u';
            end
            
        end
    end

    if changed
        temp = P';
        P = H';
        H = temp;
        B = B';
    end

end

function u = householder_vector(x)
    if isrow(x)
        x = x';
    end

    % Calcolo del valore sigma
    sigma = sign(x(1)) * norm(x);

    % Calcolo del versore u
    u = x + sigma * eye(length(x), 1);
    u = u / norm(u);
end