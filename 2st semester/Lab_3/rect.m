function Q = rect(f,a,b,n)
% Composite mid-point (rectangle) rule
%    f,a,b -- function and the interval endpoints
%        n -- number of subintervals

h = (b-a)/n;
x = linspace(a, b-h, n) + h/2;
Q = sum(f(x)) * h;
