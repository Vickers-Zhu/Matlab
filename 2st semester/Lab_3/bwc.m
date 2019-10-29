function bwc(seed)
% A flaying copter - Border Watch Copter :)
% The optional paramater seed is the random seed.
% This function uses the auxiliary function "copter.m".
% Draft version.

rng('default');
if nargin == 1
    rng(seed);
end

scale = 2;  % size of the copter
rspdmlt = 1;  % rotor speed modifier
minrspd = pi/24;  % minimum rotor speed
speed = 0;  % copter speed
angle = pi;  % direction (an angle)
rangle = 0;  % rotor wings angle
dspeed = 0;  % initial acceleration
dangle = 0;  % initial direction change
x = 0;  % copter x coordinate
y = 0;  % copter y coordinate
warmup = 200;  % engine warm-up time

f = figure('MenuBar','none','Color',[0.9 0.9 0.9]);
set(f,'Position',[400 100 560 500]);
ax = axes('NextPlot','add');
title(ax,'Border watch copter');
axis(ax, [-1.2 1.2 -1.2 1.2]);
set(ax,'XTick',[],'YTick',[],'XColor','white','YColor','white');
set(ax,'OuterPosition',[-0.05 -0.025 1.065 1.02]);
[b,r] = copter(scale,x,y,angle,rangle);
cp = plot(b(1,:),b(2,:),'color',[ 0.7 0.7 0 ],'linewidth',5);
rp = plot(r(1,:),r(2,:),'color',[ 0.3 0.3 0.3 ],'linewidth',2.5);

pause(2.5);
warmstep = 0; 
while ishandle(f)
    if warmstep < warmup
        warmstep = warmstep + 1;
        rspd = rspdmlt*minrspd*warmstep/warmup;
    else
        oldangle = angle;
        oldspeed = speed;
        % Random acceleration change
        dspeed = dspeed + (2*rand()-1)/20000;
        % Limitation of the acceleration
        if abs(dspeed) > 0.0005
            dspeed = dspeed*0.0005/abs(dspeed);
        end
        speed = speed + dspeed;
        speed = max(0, speed);
        % Limitation of speed, if close to an edge...
        xspeed = cos(angle)*speed;
        yspeed = sin(angle)*speed;
        if xspeed > 0
            speed = min(speed, speed*0.04*(1-x)/xspeed);
        end
        if xspeed < 0
            speed = min(speed, speed*0.04*(-1-x)/xspeed);
        end
        if yspeed > 0
            speed = min(speed, speed*0.04*(1-y)/yspeed);
        end
        if yspeed < 0
            speed = min(speed, speed*0.04*(-1-y)/yspeed);
        end
        % Random change of direction
        dangle = dangle + (2*pi*rand()-pi)/2000;
        % Limiting direction change speed...
        ascale = 72*max(1,100*speed);
        if abs(dangle) > pi/ascale
            dangle = dangle*pi/ascale/abs(dangle);
        end
        % Limitation of direction change if close to an edge...
        if abs(cos(angle)) > abs(sin(angle))
            dangle = sign(dangle)*min(abs(dangle),...
                                      0.05*sqrt(abs(x+cos(angle))));
        else
            dangle = sign(dangle)*min(abs(dangle),...
                                      0.05*sqrt(abs(y+sin(angle))));
        end
        % Updating copter flight parameters...
        angle = angle + dangle;
        dangle = angle - oldangle;
        dspeed = speed - oldspeed;
        rspd = rspdmlt*(minrspd + 2*speed*pi);
        if angle > 2*pi, angle = angle - 2*pi; end
        if angle < 0, angle = 2*pi + angle; end
    end
    rangle = rangle + rspd;
    x = x + speed*cos(angle);
    y = y + speed*sin(angle);
    % Drawing the copter...
    [b,r] = copter(scale,x,y,angle,rangle);
    set(cp,'XData',b(1,:));
    set(cp,'YData',b(2,:));
    set(rp,'XData',r(1,:));
    set(rp,'YData',r(2,:));
    pause(0.015);
    drawnow;
end