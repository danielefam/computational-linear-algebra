n = 10;
A = zeros(n, n);

[P, B, H] = bidiagonalize(A);
[Q, D] = bidiagonal_eigs(B, P, H);
[U, R, Perm] = qr(A);
Sigma = R;
V = Q*Perm;