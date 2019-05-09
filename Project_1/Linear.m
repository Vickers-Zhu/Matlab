function [x] = Linear(L, b)

y = inv(L) * b;
x = inv(L') * y;
