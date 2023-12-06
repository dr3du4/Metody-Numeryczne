% equnonlin_solve.m
clear all; close all;
it = 20;
a = pi-pi/5; b=pi+pi/5; % znajdz zero funkcji y=sin(x) dla x=pi
f = @(x) x.^2+5*x+1; % definicja funkcji
fp = @(x) 2*x+5; % definicja pochodnej funkcji
x = 0 : 0.01 : 2*pi;
plot( x, f(x), 'b-', x, fp(x),'r-'); grid; xlabel('x'); title('f(x), fp(x)');
legend('Funkcja','Jej pochodna'); pause
cb = nonlinsolvers( f, fp, a, b, 'bisection', it );
cr = nonlinsolvers( f, fp, a, b, 'regula-falsi', it);
cn = nonlinsolvers( f, fp, a, b, 'newton-raphson', it);
cm = nonlinsolvers( f, fp, a, b, 'Muller', it);
cs = nonlinsolvers( f, fp, a, b, 'sieczne', it);

plot( 1:it,cb,'o-', 1:it,cr,'*', 1:it,cn,'^-',1:it,cs,'*-',1:it,cs,'o-'); xlabel('iter'); title('c(iter)')
grid on, legend('Bisection','Regula-Falsi','Newton-Raphson',"Sieczne", "Muller");
