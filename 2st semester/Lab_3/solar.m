function solar(seed)

rng('default');
if nargin == 1
    rng(seed);
end

f = figure('MenuBar','none','Color',[0.9 0.9 0.9]);
set(f,'Position',[400 100 800 600]);
ax = axes('NextPlot','add');
title(ax,'Solar System');
axis(ax, [-100 100 -100 100]);
set(ax,'XTick',[],'YTick',[], 'ZTick', [], 'XColor','white', ...
    'YColor','white', 'ZColor', 'white'); 
set(ax,'OuterPosition',[-0.05 -0.025 1.065 1.02]);
view(3);
[x1, y1] = planets('Mercury', 10, 0);
mercury = plot3(x1, y1, 0, 'o');
[x2, y2] = planets('Venus', 10, 0);
venus = plot3(x2, y2, 0, 'X');
[x3, y3] = planets('Earth', 10, 0);
earth = plot3(x3, y3, 0, '*');
[x4, y4] = planets('Mars', 10, 0);
mars = plot3(x4, y4, 0, '*');
[x5, y5] = planets('Jupiter', 10, 0);
jupiter = plot3(x5, y5, 0, '*');
[x6, y6] = planets('Saturn', 10, 0);
saturn = plot3(x6, y6, 0, '*');
[x7, y7] = planets('Uranus', 10, 0);
uranus = plot3(x7, y7, 0, '*');
d = 0;

pause(1.5);
while ishandle(f)
    d = d + 1;
    [x1, y1] = planets('Mercury', 10, d);
    [x2, y2] = planets('Venus', 10, d);
    [x3, y3] = planets('Earth', 10, d);
    [x4, y4] = planets('Mars', 10, d);
    [x5, y5] = planets('Jupiter', 10, d);
    [x6, y6] = planets('Saturn', 10, d);
    [x7, y7] = planets('Uranus', 10, d);
    set(mercury, 'XData', x1);
    set(mercury, 'YData', y1);
    set(venus, 'XData', x2);
    set(venus, 'YData', y2);
    set(earth, 'XData', x3);
    set(earth, 'YData', y3);
    set(mars, 'XData', x4);
    set(mars, 'YData', y4);
    set(jupiter, 'XData', x5);
    set(jupiter, 'YData', y5);
    set(saturn, 'XData', x6);
    set(saturn, 'YData', y6);
    set(uranus, 'XData', x7);
    set(uranus, 'YData', y7);
    pause(0.015);
end
