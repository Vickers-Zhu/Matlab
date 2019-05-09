% MENU
clear
clc
finish=5;  
kontrol=1;
while kontrol~=finish 

    kontrol=menu('Menu', 'Ex.1: f(x)= x^2*sin(10*x)', 'Your function f','Integral','Plot y=f(x)', 'FINISH');

    switch kontrol
		case 1
			 f=@(x) x.^2.*sin(10.*x)
					
	    case 2
			f=input('f=  ')
             							
		case 3
            format long e
			a=input('a=  ');
			b=input('b=  ');
            disp('Integral ')
            I = integral(f, a, b)
			
		case 4
            N=input('Numer of points from [a,b] ');
			fplot(f, [a, b], N)
			title(strcat('[', char(f), '] in the interval [', num2str(a), ' ; ', num2str(b), ']'))
			grid
			axis('square')
            xlabel('x')
			ylabel('y=f(x)')
			legend('hide')
		case 5
			disp('FINISH')
    end
end