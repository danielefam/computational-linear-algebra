function [] = plot_graphs(X, L, W, eigs_computation)
    figure(1);
    spy(W);
    figure(2);
    scatter(X(:,1), X(:,2));
    figure(3);
    [~, D] = eigs_computation(L);
    plot(diag(D));
end