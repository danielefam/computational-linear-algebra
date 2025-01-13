function [L, D, W, L_sym] = compute_laplacian_sparse(X, sigma, k)
    n = size(X, 1);
    similarity = @(x, y) exp(-norm(x - y)^2 / (2 * sigma^2));

    % Allocate memory for the elements of the sparse matrix
    rows = zeros(n * k, 1);
    cols = zeros(n * k, 1);
    vals = zeros(n * k, 1);
    % Compute the similarity matrix W
    for i = 1:n
        similarities = zeros(n, 1);
        for j = 1:n
            if i == j
                continue
            end
            similarities(j) = similarity(X(i, :), X(j, :));
        end
        [top_k_similarities, idx] = maxk(similarities, k);

        rows((i - 1) * k + 1:i * k) = i;
        cols((i - 1) * k + 1:i * k) = idx;
        vals((i - 1) * k + 1:i * k) = top_k_similarities;
    end
    W = sparse(rows, cols, vals, n, n);
    % Make W symmetric adding points that are neighbours
    % for i and not for j and vice versa
    for i = 1:n
        for j = i:n
            if W(i, j) ~= 0 && W(j, i) == 0
                W(j, i) = W(i, j);
            elseif W(j, i) ~= 0 && W(i, j) == 0
                W(i, j) = W(j, i);
            end
        end
    end

    % Compute the degree matrix D
    D_diag = sum(W, 2);
    D = spdiags(D_diag, 0, n, n);
    D_inv = spdiags((sqrt(D_diag)).^(-1), 0, n, n);
    % Compute the Laplacian matrix
    L = D - W;
    % Compute the normalized symmetric Laplacian matrix
    L_sym = D_inv * L * D_inv;
    L_sym = (L_sym'+L_sym)/2;
end