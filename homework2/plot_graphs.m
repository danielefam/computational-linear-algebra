function [] = plot_graphs(X, L, W, eigs_computation)
    figure(1);
    spy(W);
    figure(2);
    if size(X, 2) == 3
        scatter3(X(:,1), X(:,2), X(:,3), 5);
    else
        scatter(X(:,1), X(:,2), 5);
    end
    figure(3);
    [~, D] = eigs_computation(L);
    plot(abs(diag(D)));
end