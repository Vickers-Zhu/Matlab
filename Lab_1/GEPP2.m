function [x,r]=GEPP2(A,b)
% [x,r]=GEPP2(A,b)
% GEPP for solving the system  Ax=b
% r=b-A*x 
% n=4; A=pascal(n); z=ones(n,1);b=A*z;[x,r]=GEPP1(A,b)

n=max(size(A));
nb=size(b);
x=zeros(n,1);
r=x;
if nb~=n
    disp('Dimensions of A and b are not correct.');
    return;
end

% PLU=L*U
[L,U,p]=lu(A,'vector');
err_dec=norm(A(p,:)-L*U)/norm(A)

%LUx=P*b

y=L\(b(p));
x=U\y;
r=b-A*x;
err_backward=norm(r)/(norm(A)*norm(x)+norm(b))
end