clc; close all; clear all;
A = reshape(1:12, [3,4])';

% circle_ds = load('../homework2/datasets/Circle.mat');
% X_circle = circle_ds.X;

[P, B, H] = bidiagonalize(A);

A0 = P'*B*H';

[Q1, B1, P1] = bidiag_lapack(A);

[b1_eigvec,check_B1_eigs] = eigs(B1'*B1);
[b_eigvec,check_B_eigs] = eigs(B'*B);
[a_eigvec,check_A_eigs] = eigs(A'*A);

% check_A_eigs, check_B_eigs, check_B1_eigs
a_eigvec
eigvec_from_B = H*b_eigvec
eigvec_from_B1 = P1*b1_eigvec

% chech if everithing is fine
A'*A*eigvec_from_B 
eigvec_from_B*check_B_eigs
