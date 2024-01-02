% Wczytaj plik dźwiękowy
nazwaPliku = 'nasza_probka.mp3';
[y, fs] = audioread(nazwaPliku);

klastryfikacja(y,fs);
zaszumiony=zaszumienie(y,fs);
klastryfikacja(zaszumiony,fs);

%player = audioplayer(zaszumiony, fs);
%play(player);

sygnalOdszumiony=usuniecieSzumu(y,zaszumiony,fs);
klastryfikacja(sygnalOdszumiony, fs);

player = audioplayer(sygnalOdszumiony, fs);
play(player);

