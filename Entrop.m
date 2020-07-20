function [rak_val] = Entrop(X)
    G = 256;
    [L, N] = size(X);
    rak_val = zeros(L, 1);
    minX = min(X(:));
    maxX = max(X(:));
    edge = linspace(minX, maxX, G);
    for i = 1 : L
        histX = hist(X(i, :), edge) / N;
        rak_val(i) = - histX * log(histX + eps)';
    end
end
