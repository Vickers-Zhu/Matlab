function [ A ] = Wilk1(n)
%  Famous Wilkinson's matrix with large the growth factor (for GE and GEPP) 
% n=200;A=Wilk1(n);z=ones(n,1);b=A*z;cond_A=cond(A), x=A\b;x'

A=2*eye(n)-tril(ones(n));
A(:,n)=ones(n,1);
end

