function X=inv_lower1(A)
% X=inv_lower1(A), where A is lower-triangular
% X=A^{-1}, X is lower-triangular
% n=4;A=tril(ones(n));X=inv_lower1(A)
% 
[m,n]= size(A);
X=[ ]; % Empty matrix

if m~=n,
    disp('m should be equal to n');
    return;
end

if norm(A-tril(A),'fro')>0
    disp('Your matrix is not lower-triangular');
    return;
end

X=zeros(n);
d=diag(A);

if ~all(d),
    disp('Diagonal element of A  equals  0');
    return;
end

for j=1:n,
    X(j,j)=1/A(j,j);
    for i=j+1:n
        s=0;
        for k=j:(i-1)
            s=s+A(i,k)*X(k,j);
        end
        X(i,j)=-s/A(i,i);
    end
end
end
