function [x]=Upper_triangular2(A,b)
% [x]=Upper_triangular2(A,b)
% x is the solution of Ax=b, where A is upper triangular

[m,n]= size(A);
x=zeros(n,1);

if m~=n,
    disp('m should be equal to n');
    return;
end

if norm(A-triu(A),'fro')>0
    disp('A is not upper triangular!');
    return;
end

d=diag(A);

if ~all(d),
    disp('Diagonal element of A  equals  0');
    return;
end

x(n)=b(n)/A(n,n);

for i=n-1: -1:1,
    x(i)=(b(i)-A(i,i+1:n)*x(i+1:n))/A(i,i);
end
end
