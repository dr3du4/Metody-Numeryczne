% Wczytaj plik dźwiękowy
nazwaPliku = 'burzum.mp3';
[y, fs] = audioread(nazwaPliku);

% Generuj szum pseudolosowy
szum = 10 * randn(size(y));

% Dodaj szum do sygnału muzycznego
y_z_szumem = y + szum;

% Odszumianie sygnału
rozmiar_okna_filtra = 11;  % Dostosuj rozmiar okna filtra
sygnal_odszumiony = odszumianie(y_z_szumem, rozmiar_okna_filtra);



% Odtwórz odszumiony sygnał
sound(sygnal_odszumiony, fs);