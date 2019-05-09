function [s,iter]=series1(steps,tol)
% s=series1(tol,iter)
% s(k)=a(1)+a(2)+...+a(k) where a(k)=1/(k*(k+1))
% iter: |s(k+1)-s(k)|<=tol
% iter<= steps
%

if (nargin==1)
    tol=100*eps;
end


k=2;
s=1/2;d=1/(2*3);s=s+d;
while (abs(d)>tol  &&  k < steps)
    k=k+1;
    d=1/(k*(k+1));
    s=s+d;
end
iter=k;

if (nargout==1)
    s
end
end