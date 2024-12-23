function [] = kmeans_plot(X, L, M)
    [U, ~] = eigs(L, M, 'smallestabs');

    idx = kmeans(U, M);
    figure;
    colors = ['r', 'g', 'b'];
    hold on
    for i = 1:M
        scatter(X(idx==i,1),X(idx==i,2),colors(i))
    end
    hold off
end