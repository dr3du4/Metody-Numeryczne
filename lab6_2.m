% Dane
A = [2 1; 3 2; 1 4];
B = [5; 8; 12];

% Jawna dekompozycja QR
[m, n] = size(A);
Q = zeros(m, n);
R = zeros(n, n);

for j = 1:n
    v = A(:, j);
    for i = 1:j-1
        R(i, j) = Q(:, i)' * A(:, j);
        v = v - R(i, j) * Q(:, i);
    end
    R(j, j) = norm(v);
    Q(:, j) = v / R(j, j);
end

% Wyodrębnienie macierzy R1 i wektora r1
R1 = R(1:size(R, 2), :);
r1 = Q' * B;

% Rozwiązanie układu równań R1x = r1
x = R1 \ r1;

% Wyniki
disp('Wektor niewiadomych x:');
disp(x);