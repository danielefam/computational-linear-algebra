close all; clc;

A = diag([4,2,3]);

[eigval, eigvec] = inverse_power_method(A);