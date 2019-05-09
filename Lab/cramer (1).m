function [x,r]=cramer(A,b)
% [x,r]=cramer(A,b)
% Cramer's method for solving the system Ax=b
% Here r=b-A*x

n=max(size(A));b=b(:);
x=zeros(n,1);r=x;
detA=det(A);
if detA==0, 
    disp('detA=0'); 
    return;
end

for i=1:n,
     B=A;
     B(:,i)=b;
     x(i)=det(B)/detA;
end

r=b-A*x;
end