function [L] = Cholesky(M)

if ~ismatrix(M)
    error("Input must be a matrix");
end
n = length(M);
L = zeros(n);
for i = 1 : n
    L(i, i) = sqrt(M(i, i) - L(i, :) * L(i, :)');
    for j = (i + 1):n
        L(j, i) = (M(j, i) - L(i, :) * L(j, :)') / L(i, i);
    end
end

end
