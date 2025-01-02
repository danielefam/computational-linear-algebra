clc;
A = reshape(1:20, [4,5])';


[P, B, H] = bidiagonalize(A);

B;
A = P'*B*H';

% [Q, B1, P] = bidiag_lapack (A);
% B1

check_B_eigs = eigs(B'*B)
check_A_eigs = eigs(A'*A)