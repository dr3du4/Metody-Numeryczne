% equnonlin_fzero.m
clear all; close all;
x = 0 : .02 : 2; % zmiennosc argumentu
y = fun_zero(x); % zmiennosc funkcji, zdefiniowanej ponizej albo zapisaj na dysku
figure; plot(x,y); % rysunek
title('Funkcja y=f(x) - zauwaz zero w poblizu x = 1.3'), grid
% Aby znalezc zero funkcji w otoczeniu x = 1.3, wywolujemy funkcje FZERO
xokolica = 1.3; % x w poblizu ktorego szukamy zera
xtoler = 1e-9; %eps; % tolerancjsca rozwiazania
z = fzero( 'fun_zero', xokolica, xtoler); % wyznaczmy argument zerá
x = 0.8 : .01 : 1.6; % x w otoczeniu zera
y = fun_zero(x); % y w otoczeniu zera
figure; plot( x, y, z, fun_zero(z),'ro'); % rysujemy funkcje i obliczone zero
title('(o) Zero funkcji y=f(x)'); grid; % tytul
zero = z, % argument zera
wartosc_funkcji = fun_zero(z) % wartosc dla zera
