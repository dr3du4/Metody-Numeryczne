clear all;
close all;
% Dane
A = [2 1; 3 2; 1 4];
B = [5; 8; 12];

% Transpozycja macierzy A
A_transpose = transpose(A);

% Iloczyn transponowanej macierzy A i macierzy A
A_transpose_A = A_transpose * A;

% Odwrotność iloczynu transponowanej macierzy A i macierzy A
inverse_A_transpose_A = inv(A_transpose_A);

% Iloczyn transponowanej macierzy A i macierzy B
A_transpose_B = A_transpose * B;

% Rozwiązanie układu równań
x = inverse_A_transpose_A * A_transpose_B;

% Wyniki
disp('Wektor niewiadomych x:');
disp(x);