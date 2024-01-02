% Wczytaj plik dźwiękowy
nazwaPliku = 'nasza_probka.mp3';
[y, fs] = audioread(nazwaPliku);

klastryfikacja(y,fs);
zaszumiony=zaszumienie(y,fs);
klastryfikacja(zaszumiony,fs);

sygnalOdszumiony=usuniecieSzumu(y,zaszumiony,fs);
klastryfikacja(sygnalOdszumiony, fs);
sound(sygnalOdszumiony);



