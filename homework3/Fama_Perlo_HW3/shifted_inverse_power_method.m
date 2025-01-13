function [lambda, x] = shifted_inverse_power_method(A, p, x0, maxit, tol)

n = size(A, 1);

if nargin < 5
    tol = 1e-6;
end
if nargin < 4
    maxit = 1000;
end
if nargin < 3
    x0 = ones(size(A, 1), 1);
end

mu = p;
% Normalize the initial vector
x = x0 / norm(x0);

% LU decomposition
[L, U, P] = lu(A - p * eye(n));
for i = 1:maxit
    x_new = U \ (L \ (P * x));
    mu = dot(x, x_new);
    x = x_new / norm(x_new);
    % Check for convergence
    if norm(A*x - p*x) < tol
        break;
    end
end
% Compute the eigenvalue
lambda = p + 1 / mu;

end