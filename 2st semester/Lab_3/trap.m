function Q = trap(f,a,b,n)
% Composite trapezoidal rule
%    f,a,b -- function and the interval endpoints
%        n -- number of subintervals

h = (b-a)/n;
x = linspace(a+h,b-h,n-1);
Q = ( (f(a) + f(b))/2 + sum(f(x)) ) * h;
