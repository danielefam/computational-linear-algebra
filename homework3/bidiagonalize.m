function [P, B, H] = bidiagonalize(A)
    [m, n] = size(A);

    if m < n
        disp('MATRIX IS NOT GOOD!');
        P = []; 
        B = []; 
        H = [];
        return
    end  

    B = A;
    P = eye(m);
    H = eye(n);

    for j = 1:n-1
        Px = householder_mat(B(j:end, j));
        
        Pj = eye(m);
        Pj(j:end, j:end) = Px;
        
        B = Pj * B;

        Hx = householder_mat( B(j, j+1:end) );
        Hj = eye(n);
        Hj(j+1:end, j+1:end) = Hx; 
        B = B * Hj;
        
        H = H * Hj;
        P = Pj * P;
    end

    
        j = n;
        Px = householder_mat(B(j:end, j));
        
        Pj = eye(m);
        Pj(j:end, j:end) = Px;
        
        B = Pj * B;
        P = Pj * P;
    

end

