
clc
clear

axis square

hold on
grid on

t=0:0.1:2*pi;
r=5;
x=r*cos(t);
y=r*sin(t);
plot(x,y,'r:');

axis([-r-1,r+1,-r-1,r+1]);

r=3;
x=r*cos(t);
y=r*sin(t);
plot(x,y,'LineWidth',2,'Color','g');


legend('r=5','r=3');
