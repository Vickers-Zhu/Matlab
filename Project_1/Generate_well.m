function [A] = Generate_well(n)
if(rem(n/3, 1) ~= 0)
    disp("Cannot be divided by 3");
    return;
end

p=n/3; 
B=n*pascal(p);
I=eye(p);
Z=zeros(p);
A=[B I Z;I B I;Z I B];
