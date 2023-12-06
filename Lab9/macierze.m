% Definicja parametru A
A = 4;

% Współczynniki wielomianu dla f1(x) = x^2 - A
p1 = [1 0 -A];

% Współczynniki wielomianu dla f2(x) = (x - A)^2
p2 = [1 -2*A A^2];

% Współczynniki wielomianu dla f3(x) = (x - A)^3
p3 = [1 -3*A 3*A^2 -A^3];

% Znalezienie miejsc zerowych dla każdej funkcji
roots_f1 = roots(p1);
roots_f2 = roots(p2);
roots_f3 = roots(p3);

% Wyświetlenie wyników
disp('Miejsca zerowe dla f1(x) = x^2 - A:');
disp(roots_f1);

disp('Miejsca zerowe dla f2(x) = (x - A)^2:');
disp(roots_f2);

disp('Miejsca zerowe dla f3(x) = (x - A)^3:');
disp(roots_f3);