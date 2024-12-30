function [] = plot_graphs(X, L, W, eigs_computation)
    figure(1);
    spy(W);
    xlabel('j')
    ylabel('i')
    figure(2);
    if size(X, 2) == 3
        scatter3(X(:,1), X(:,2), X(:,3), 16, Marker='o',  MarkerFaceColor='blue');
    else
        scatter(X(:,1), X(:,2), 16, Marker='o',  MarkerFaceColor='blue');
        xlabel('x1')
        ylabel('x2')  
    end
    figure(3);
    [~, D] = eigs_computation(L);
    plot(abs(diag(D)), Marker='o');
    xlabel('i')
    ylabel('|\lambda_i|')
end