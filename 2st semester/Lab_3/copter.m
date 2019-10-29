function [b,r] = copter(s,x,y,a,ra)
% The function "generates" a copter of size s, at angle a
% and rotor angle ra, at the position (x,y).
% Output: b - hull, r - rotor (2 by ? matrices).

if nargin < 1, s = 1; end
if nargin < 2, a = 0; end
if nargin < 3
    ra = a;
else
    ra = a + ra;
end

u = s*0.01;  % dimension unit
cl = 10*u;  % size of the copter
rl = 5.5*u;  % length of the rotor wings

% Rotor...
r = [ 0 rl 0 rl*cos(pi/3) 0 rl*cos(2*pi/3) 0 ...
      -rl 0 rl*cos(4*pi/3) 0 rl*cos(5*pi/3) 0;
      0 0 0 rl*sin(pi/3) 0 rl*sin(2*pi/3) 0 ...
      0 0 rl*sin(4*pi/3) 0 rl*sin(5*pi/3) 0 ];
    
% Rotor after rotation and shift...
r = [ cos(ra) -sin(ra); sin(ra)  cos(ra) ] * r + ...
    [ x ; y ] * ones(1,size(r,2));

% Hull...
b = [ 0 -0.3 -0.25 0.25 0.3 0.25 -0.25 -0.3 -1 -0.9 -0.9 -0.9 -0.9 0 ; ...
      0  0    0.1  0.1  0  -0.1  -0.1   0    0  0    0.2 -0.2  0   0 ];

% Hull after rotation and shift...
b = [ cos(a) -sin(a); sin(a)  cos(a) ] * b * cl + ...
    [ x ; y ] * ones(1,size(b,2));
