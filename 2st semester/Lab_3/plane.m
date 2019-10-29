% A tiny plane example...

S = [ 0 1 0 3 3  3 3 0  1 0 -2 0 ; ...
      0 3 0 0 1 -1 0 0 -3 0  0 0 ]; % plane data x'es; y's

scale = 2; % size of the plane

SP = S;
plot(SP(1,:),SP(2,:),'linewidth',10)
axis([-32 32 -18 18])
pause

a = pi/6; % some direction (an angle)
p = [ -7 ; -12 ]; % some shift
G = [ cos(a) -sin(a); sin(a)  cos(a) ]; % rotation matrix
SP = scale*S;
SP = G*SP; % rotation
SP = SP + p; % shift
plot(SP(1,:),SP(2,:),'linewidth',10*scale) % drawing the plane again
% note that a nice animation is based on setting 'XData'
% and 'YData' of a plot object
axis([-32 32 -18 18])
