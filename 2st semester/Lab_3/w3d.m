function w3d
% A simple 3D graph :)

x = -5:0.1:5;
y = -5:0.1:5;
[X,Y] = meshgrid(x,y);
Z = cos(X.^2+Y.^2) ./ (1+X.^2+Y.^2);
ax = axes;
sx = surf(X,Y,Z,'LineStyle','none');
set(ax,'XLim',[-5 5],'YLim',[-5 5],'ZLim',[-1 1]);

% An unfinished test part...
% How to prevent color auto-"scaling"?
pause;
N = 32;
Cycles = 4;
for i = 1:Cycles*N
    pause(0.1)
    Z = cos(X.^2+Y.^2-2*pi*i/N) ./ (1+X.^2+Y.^2);
    set(sx,'ZData',Z);
    drawnow % is this line it necessary?
end
