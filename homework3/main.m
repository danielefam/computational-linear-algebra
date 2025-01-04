n = 10;
rng(42);
A = rand(n, n);

[P, B, H] = bidiagonalize(A);
[U2, S, V2] = bidiagonal_svd(B);
U = P'*U2;
V = H*V2;
norm(A*V - U*S)

[Utrue, Strue, Vtrue] = svd(A);