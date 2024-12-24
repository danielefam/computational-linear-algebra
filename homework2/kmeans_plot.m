function [] = kmeans_plot(X, L, M)
    [U, ~] = eigs(L, M, 'smallestabs');

    idx = kmeans(U, M);
    colors = turbo(M);
    figure(4);
    for i = 1:M
        if size(X, 2) == 3
            scatter3(X(idx==i,1),X(idx==i,2),X(idx==i,3),5,colors(i,:))
        else
            scatter(X(idx==i,1),X(idx==i,2),5,colors(i,:))
        end
        legendInfo{i} = ['Cluster ' num2str(i)];
        hold on
    end
    legend(legendInfo);
    hold off
end