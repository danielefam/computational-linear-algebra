function [L, D, KNN, L_sym] = compute_laplacian(X, sigma, k)

n = size(X, 1);
similarity = @(x, y) exp(-norm(x - y)^2 / (2 * sigma^2));

W = zeros(n, n);

% Compute the similarity matrix W
for i = 1:n
    for j = i+1:n
        W(i, j) = similarity(X(i, :), X(j, :));
        W(j, i) = W(i, j);
    end
end

% Compute the k-NN graph matrix
[~, I] = maxk(W, k);
KNN = zeros(n, n);
for j = 1:n
    for i = I(:, j)'
        KNN(i, j) = W(i, j);
        KNN(j, i) = KNN(i, j);
    end
end
D = sum(KNN, 2);
L = diag(D) - KNN;

D_inv = spdiags((sqrt(D)).^(-1), 0, n, n);
% Convert to sparse matrices
D = spdiags(D, 0, n, n);
L = sparse(L);
KNN = sparse(KNN);

% Compute the normalized symmetric Laplacian matrix
L_sym = D_inv * L * D_inv;
L_sym = (L_sym'+L_sym)/2;

end