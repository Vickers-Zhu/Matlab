function [d] = Derivatives(y, n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if isa(y, 'function_handle')
    disp('Np')
else
      disp('Yeah bro');

end
d = y;
for i = 1 : n
    t = diff(d);
    d = t;
end
end

