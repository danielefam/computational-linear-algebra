function [U2, S, V2] = bidiagonal_svd(B, maxit, tol)

if nargin < 2
    maxit = 1000;
end
if nargin < 3
    tol = 1e-12;
end

n = size(B, 1);
a2 = diag(B).^2;
b2 = diag(B, 1).^2;

U2 = zeros(n);
V2 = zeros(n);

for i = 1:maxit
    a2(1) = a2(1) + b2(1);
    b2(1) = a2(2) * b2(1) / a2(1);
    for j = 2:n-1
        a2(j) = a2(j) + b2(j) - b2(j-1);
        b2(j) = a2(j+1) * b2(j) / a2(j);
    end
    a2(n) = a2(n) - b2(n-1);
    sd = a2(1:n-1).*b2;
    if all(abs(sd) < tol)
        break;
    end
end

S = diag(sqrt(a2));
T = B'*B;
eigs = zeros(n, 1);
for i = 1:n
    [eigs(i), V2(:,i)] = shifted_inverse_power_method(T, a2(i));
    U2(:,i) = B*V2(:,i) / S(i,i);
end

end