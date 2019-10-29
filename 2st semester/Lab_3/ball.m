function ball(N,mv,mass,fate)
% Red ball in a field of charged blue balls.
% N -- number of blue balls (dafault: 100)
% mv -- speed multiplier (default: 1.5)
% mass -- mass of red ball (default: 3e+9)
% fate -- random seed

if nargin < 1 || isempty(N) 
    N = 100; % number of blue balls
end
if nargin < 2 || isempty(mv)
    mv = 1.5; % speed multiplier
end
if nargin < 3 || isempty(mass)
    mass = 3e9; % mass of the red ball
end
if nargin < 4 || isempty(fate)
    fate = 7012;
end

% Setting initial values:
rng(fate); % initialising random generator
x = rand(1,N); % 'x' positions of blue balls
y = rand(1,N); % 'y' positions of blue balls
vx = -0.0003*mv; % 'x' coordinate of the red ball initial speed
vy = -0.0001*mv; % 'y' coordinate of the red ball initial speed
px = 1.0; % initial position of the red ball
py = 0.5; % as above

% Creating window, drawing blue balls...
h = figure('MenuBar','none','Position',[340 100 600 520]);
ha = axes;
plot(x,y,'sb','MarkerSize',2,'MarkerFaceColor','b');
axis(ha,[0 1 0 1]);
set(ha,'NextPlot','add');
% ...and the red ball
p = plot(px,py,'or','MarkerSize',4,'MarkerFaceColor','r');
pause;

k = 0; % "frame" counter
while abs(vx) + abs(vy) < 0.01 && ishandle(h) % Red ball movement...
    dx = px - x;
    dy = py - y;
    ax = sum(dx./sqrt(dx.^2+dy.^2).^3)/mass; % Pushing away...
    ay = sum(dy./sqrt(dx.^2+dy.^2).^3)/mass; % as above
    vx = vx + ax;
    vy = vy + ay;
    px = px + vx;
    if px < 0.0 || px > 1.0
    vx = -vx; % bouncing from the wall
    end
    py = py + vy;
    if py < 0.0 || py > 1.0
    vy = -vy; % bouncing from the wall
    end    
    k = k + 1;
    if mod(k,16) == 0
        if ishandle(h)
            set(p,'XData',px,'YData',py); % UPDATING RED BALL LOCATION DATA
            if mod(k,1000) == 0
                title(['Speed    =    ',num2str(abs(vx)+abs(vy),...
                    '%1.6f'),' * lightspeed']);
                k = 0;
            end
        else
            return % exit if figure has been deleted
        end
        drawnow % REDRAWING THE UPDATED DATA
    end
end

if ishandle(h)
    pause;
    close(h);
end