nazwaPliku = 'nasza_probka.mp3';
[y, fs] = audioread(nazwaPliku);


szum = 0.1 * randn(size(y))+20;
y_z_szumem = y + szum;

% Inicjalizuj zmienne do przechowywania najlepszego rezultatu
najlepszy_wynik = Inf;
najlepszy_rozmiar_okna_filtra = 0;

% Sprawdź różne rozmiary okna filtra
for rozmiar_okna_filtra = 1:2:101  % Różne nieparzyste rozmiary okna filtra
    % Odszumianie sygnału
    sygnal_odszumiony = odszumianie(y_z_szumem, rozmiar_okna_filtra);

    % Oblicz różnicę między oryginalnym a odszumionym sygnałem
    roznica = norm(y - sygnal_odszumiony);

    % Jeżeli aktualny wynik jest lepszy, zaktualizuj najlepszy wynik i rozmiar okna filtra
    if roznica < najlepszy_wynik
        najlepszy_wynik = roznica;
        najlepszy_rozmiar_okna_filtra = rozmiar_okna_filtra;
    end
end

% Wyświetl najlepszy rozmiar okna filtra
disp(['Najlepszy rozmiar okna filtra: ' num2str(najlepszy_rozmiar_okna_filtra)]);

% Odszumianie sygnału z najlepszym rozmiarem okna filtra
sygnal_odszumiony_najlepszy = odszumianie(y_z_szumem, najlepszy_rozmiar_okna_filtra);


sound(sygnal_odszumiony_najlepszy)
