clear 
clc
f= @(x) sin(x);
%f=@ (x) x*x*x-4*x-9;
%Write your function f(x), where f(x)=0.
% Root lies between in the interval (x0, x1).
x0=pi-pi/5; %here x0=2
x1=pi+pi/5;%here x1=3
epsilon=10^-6; %error of tolerance you want. 
%for exmple 0.001 or 0.0001 etc.
 %Formula: x2=(x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
if f(x0)*f(x1)>0 
    disp('Enter valid interval !!!');
    return
else
err=abs(x1-x0);
fprintf('\n x0 \t\t x1 \t\t f(x0) \t\t f(x1)');
fprintf('\n %0.4f \t %0.4f \t %0.4f \t %0.4f',x0,x1,f(x0),f(x1));
while err > epsilon
    x2=(x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
    x0=x1;        
    x1=x2;
    err=abs(x1-x0);
    root=x2; 
    fprintf('\n %0.4f \t %0.4f \t %0.4f \t %0.4f',x0,x1,f(x0),f(x1));
end
    fprintf('\n The root is %4.3f ',root);
end