function solar(seed)

rng('default');
if nargin == 1
    rng(seed);
end

f = figure('MenuBar','none','Color',[0.9 0.9 0.9]);
set(f,'Position',[400 100 800 600]);
ax = axes('NextPlot','add');
title(ax,'Solar System');
axis(ax, [-500 500 -500 500]);
set(ax,'XTick',[],'YTick',[], 'ZTick', [], 'XColor','white', ...
    'YColor','white', 'ZColor', 'white'); 
set(ax,'OuterPosition',[-0.05 -0.025 1.065 1.02]);
view(3);
z = 0;
% z-coordinate of the sun.
r = 4;
% radius.
distance = 20;
% Distance to the central point.
day = 0;
% Tick for action.

[x_sp, y_sp, z_sp] = sphere(30);

[x1, y1, r1] = planets('Mercury', distance, r, day);
[x2, y2, r2] = planets('Venus', distance, r, day);
[x3, y3, r3] = planets('Earth', distance, r, day);
[x4, y4, r4] = planets('Mars', distance, r, day);
[x5, y5, r5] = planets('Jupiter', distance, r, day);
[x6, y6, r6] = planets('Saturn', distance, r, day);
[x7, y7, r7] = planets('Uranus', distance, r, day);

% sun = surf(x_sp*109*r, y_sp*109, z_sp*109+z);
mercury = surf(x_sp*r1+x1, y_sp*r1+y1, z_sp*r1+z);
venus = surf(x_sp*r2+x2, y_sp*r2+y2, z_sp*r2+z);
earth = surf(x_sp*r3+x3, y_sp*r3+y3, z_sp*r3+z);
mars = surf(x_sp*r4+x4, y_sp*r4+y4, z_sp*r4+z);
jupiter = surf(x_sp*r5+x5, y_sp*r5+y5, z_sp*r5+z);
saturn = surf(x_sp*r6+x6, y_sp*r6+y6, z_sp*r6+z);
uranus = surf(x_sp*r7+x7, y_sp*r7+y7, z_sp*r7+z);
shading interp
axis equal
camlight
lighting phong
% set(sun, 'facecolor', 'red');
set(mercury,'facecolor','#B5A7A7');
set(venus,'facecolor','#8B91A1');
set(earth,'facecolor','#3E54E8');
set(mars,'facecolor','#E27B58');
set(jupiter,'facecolor','#B45C3D');
set(saturn,'facecolor','#C5AB6E');
set(uranus,'facecolor', '#D5FBFC');

pause(1.5);
while ishandle(f)
    day = day + 1;
    [x1, y1] = planets('Mercury', distance, r, day);
    [x2, y2] = planets('Venus', distance, r, day);
    [x3, y3] = planets('Earth', distance, r, day);
    [x4, y4] = planets('Mars', distance, r, day);
    [x5, y5] = planets('Jupiter', distance, r, day);
    [x6, y6] = planets('Saturn', distance, r, day);
    [x7, y7] = planets('Uranus', distance, r, day);
    set(mercury, 'XData', x_sp*r1+x1);
    set(mercury, 'YData', y_sp*r1+y1);
    set(venus, 'XData', x_sp*r2+x2);
    set(venus, 'YData', y_sp*r2+y2);
    set(earth, 'XData', x_sp*r3+x3);
    set(earth, 'YData', y_sp*r3+y3);
    set(mars, 'XData', x_sp*r4+x4);
    set(mars, 'YData', y_sp*r4+y4);
    set(jupiter, 'XData', x_sp*r5+x5);
    set(jupiter, 'YData', y_sp*r5+y5);
    set(saturn, 'XData', x_sp*r6+x6);
    set(saturn, 'YData', y_sp*r6+y6);
    set(uranus, 'XData', x_sp*r7+x7);
    set(uranus, 'YData', y_sp*r7+y7);
    pause(0.001);
end
