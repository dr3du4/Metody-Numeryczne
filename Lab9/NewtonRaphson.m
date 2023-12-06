% equnonlin_newtonraphson.m
clear all; close all; format long;
A = 4;
f = @(x) x^2 - A; % wzor funkcji
fp = @(x) 2*x; % wzor jej pochodnej
x(1) = 10; x(2) = 9; K=10; % punkty startowe (estymata poczatkowa), liczba iteracji
for k = 3 : K
x(k)=x(k-1) - f(x(k-1)) / fp(x(k-1)); % z wzorem pochodnej
% x(k)=x(k-1) - f(x(k-1))/((f(x(k-1))-f(x(k-2)))/(x(k-1)-x(k-2))); % z estym. pochodnej
end
blad = sqrt(A) - x(K),
plot(1:K, x,'b.-', 1:K, sqrt(A)*ones(1,K),'r-'); grid; title('x(k)'); pause