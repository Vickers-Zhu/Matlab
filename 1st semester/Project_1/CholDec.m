function [L] = CholDec(A)
%Cholesky lower decomposition
%   Returns lower triangular matrix from Cholesky decomposition
if ~ismatrix(A)
    error("Input must be a square matrix")
end
if size(A,1) ~= size(A,2)
    error("Input must be a square matrix")
end
n = length(A);
e = eig(A);
for i=1:n
    if e(i)< 0
        error("Input must be a positive definite matrix")
    end
end

L = zeros(n);
for i=1:n
   L(i, i) = sqrt(A(i, i) - L(i, :)*transpose(L(i, :)));
   for j=(i + 1):n
      L(j, i) = (A(j, i) - L(i,:)*transpose(L(j ,:)))/L(i, i);
   end
end
end

