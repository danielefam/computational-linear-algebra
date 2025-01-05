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
        Px = householder_mat(B(j:end, j));        
        Pj = eye(m);
        Pj(j:end, j:end) = Px;        
        B = Pj * B;
        P = Pj * P;
        
        if j < n - 1 
            Hx = householder_mat( B(j, j+1:end) );
            Hj = eye(n);
            Hj(j+1:end, j+1:end) = Hx; 
            B = B * Hj; 
            H = H * Hj;
        end
        
    end
    
    if changed
        temp = P';
        P = H';
        H = temp;
        B = B';
    end

end

