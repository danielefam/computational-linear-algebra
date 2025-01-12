function [P, B, H] = bidiagonalize(A)
    [m, n] = size(A);

    % Transpose A if it is "fat"
    transposed = false;
    if m < n
        A = A';
        [m, n] = size(A);
        transposed = true;
    end  

    % Initialize P, H, and B
    P = eye(m);
    H = eye(n);
    B = A;
    
    for j = 1:n
        
        u = householder_vector(B(j:end, j));
        % Pj*B
        for k = j:n
            beta = 2 * (u' * B(j:end, k));
            % P*x where x is a column of B and P = I - 2uu'/||u||_2^2, then
            % P*Bk = Bk -2u'Bk u/||u||_2^2
            B(j:end, k) = B(j:end, k) - beta * u;
        end

        % Pj*P
        for k = 1:m
            beta = 2 * (u' * P(j:end, k));
            P(j:end, k) = P(j:end, k) - beta * u;
        end
        
        % B*H
        if j < n - 1
            u = householder_vector(B(j, (j+1):end)');            
            
            % B*Hj
            for k = j:m
                beta = 2 * (B(k, (j+1):end) * u);
                B(k, (j+1):end) = B(k, (j+1):end) - beta * u';
            end

            %H*Hj
            for k = 1:n
                beta = 2 * (H(k, (j+1):end) * u);
                H(k, (j+1):end) = H(k, (j+1):end) - beta * u';
            end  
            
        end
    end

    % Transpose P, H, and B back if A was transposed
    if transposed
        temp = P';
        P = H';
        H = temp;
        B = B';
    end

end

function u = householder_vector(x)
    
    % Ensure x is a column vector
    if isrow(x)
        x = x';
    end

    % Compute the Householder vector
    sigma = sign(x(1)) * norm(x);
    u = x + sigma * eye(length(x), 1);
    u = u / norm(u);
end