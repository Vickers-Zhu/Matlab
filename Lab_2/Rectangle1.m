function [S] = Rectangle1(f,a,b,m)
% [S] = Rectangle1(f,a,b,m)
% Example: f=@(x) sin(x.^2), S = Rectangle1(f,0,pi,100), I=integral(f,0,pi)
h=(b-a)/m;
S=0;
for i=1:m
    S=S+f(a+i*h-h/2);
end
S=h*S;
end

