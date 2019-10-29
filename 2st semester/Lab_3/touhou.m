function touhou(seed)

rng('default');
if nargin == 1
    rng(seed);
end

f = figure('MenuBar','none','Color',[0.9 0.9 0.9]);
set(f,'Position',[400 100 800 600]);
ax = axes('NextPlot','replacechildren');
title(ax,'Border watch copter');
% axis(ax, [-1.2 1.2 -1.2 1.2 -1.2 1.2]);
set(ax,'XTick',[],'YTick',[], 'ZTick', [], 'XColor','white', ...
    'YColor','white', 'ZColor', 'white'); 
set(ax,'OuterPosition',[-0.05 -0.025 1.065 1.02]);

t = 0:pi/50:10*pi;
st = sin(t);
ct = cos(t);
plot3(st,ct,t);
