clc;
A = rand(5,4);

circle_ds = load('../homework2/datasets/Circle.mat');
X_circle = circle_ds.X;

[P, B, H] = bidiagonalize(A);

A0 = P'*B*H';

[Q1, B1, P1] = bidiag_lapack(A);

check_B_eigs = eigs(B'*B);
check_A_eigs = eigs(A'*A);

A1 = Q1*B1*P1';
