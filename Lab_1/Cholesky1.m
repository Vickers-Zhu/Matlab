function [x,r]=Cholesky1(A,b)
% [x,r]=Cholesky1(A,b)
% Cholesky method for the solving the system  Ax=b, A=A'>0 (s.p.d.)
% r=b-A*x 
% n=4; A=pascal(n);z=(n:-1:1)';b=A*z;[x,r]=Cholesky1(A,b)
%
n=max(size(A));
nb=size(b);
x=zeros(n,1);
r=x;
if nb~=n
    disp('Dimensions of A and b are not correct.');
    return;
end

L=chol(A,'lower');
err_dec=norm(A-L*L')/norm(A)

%LL'x=b
y=L\b;
x=L'\y;
r=b-A*x;
err_backward=norm(r)/(norm(A)*norm(x)+norm(b))
end