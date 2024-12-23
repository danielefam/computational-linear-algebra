close all; clc;

rng("default")
Adiag = diag([9, 8, 4, 2, 20, 7]);
Adiag(2,3) = 3;
Adiag(3,2) = 3;
Adiag(4,5) = 3;
Adiag(5,4) = 3;
A = diag([4,2,3,1]);

% [eigval, eigvec] = inverse_power_method(L);

% [eigval1, eigvec1] = inverse_power_method(A);
% 
% B1 = deflation(A, eigval1, eigvec1,1);
% A1 = B1(2:end, 2:end);
% [eigval2, eigvec2] = inverse_power_method(A1);
% B2 = deflation(A1, eigval2, eigvec2,1);

M = 20

% exact = eigs(Adiag,M, 'smallestabs')
% res = deflation_eigenvalues(Adiag, M)
% exact = eigs(Adiag,M, 'smallestabs')

% utilizzando la matrice piena si fa prima
% tempi molto strani per alcuni autovalori visti usando tic; toc; nella
% funzione
exact = eigs(L, M, 'smallestabs')
res = deflation_eigenvalues(L, M)
% figure(1);
% plot(res, color='red', Marker='o');
% figure(2);
% plot(exact, color='blue', Marker='o');

