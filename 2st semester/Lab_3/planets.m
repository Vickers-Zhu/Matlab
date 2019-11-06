function [xunit, yunit, radius] = planets(name, distance, rad, day)

AU = [0.39, 0.72, 1.00, 1.50, 5.20, 9.50, ...
     19.20];
RVLS = [87.70, 224.70, 365, 686.98, 4332.71, 10759.5, ...
       30685];
RADIUS = [0.3824, 0.95, 1.00, 0.53, 11.2, 9.46, 4.0];

switch(name)
    case 'Mercury'
        index = 1;
    case 'Venus'
        index = 2;
    case 'Earth'
        index = 3;
    case 'Mars'
        index = 4;
    case 'Jupiter'
        index = 5;
    case 'Saturn'
        index = 6;
    case 'Uranus'
        index = 7;
end

angle = 2 * pi * mod(day, round(RVLS(index))) / round(RVLS(index));
% mod(day, round(RVLS(index))) / round(RVLS(index))
r = distance * AU(index);

xoffset = 0;
yoffset = 0;
% Distance to the central point.
th = 0:pi/100:2*pi;
[~, idx] = min(abs(th - angle));
fixedpoint = th(idx);
% find the specific point at the given day.
xunit = r * cos(fixedpoint) + xoffset;
yunit = r * sin(fixedpoint) + yoffset;
radius = RADIUS(index)*rad;
x = r * cos(th) + xoffset;
y = r * sin(th) + yoffset;
plot3(x, y, th.*0, '-');
