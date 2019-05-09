
function [x,k] = Jacobi2(A,b,max_iter,tol)
% [x,k] = Jacobi2(A,b,max_iter, tol)
% Jacobi's method for Ax=b
% n=4;a=10;A=ones(n)+a*eye(n);z=(1:n)';b=A*z;[x,k] = Jacobi2(A,b,100,1e-6)

n=max(size(A));
x0=zeros(n,1);
x=x0;
dx=tol+1;
k=0; 

d=diag(A);
if ~all(d)
    disp('Diagonal element of A is equal to 0!');
    return;
end

while norm(dx)> tol && k<= max_iter
       for i=1:n
          s=b(i);
          for j=[1:i-1,i+1:n]
              s=s-A(i,j)*x0(j);
          end
          x(i)=s/A(i,i);
       end
  
      dx=x-x0;
      k=k+1;
      x0=x;
end
end



