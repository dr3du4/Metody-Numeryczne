function sygnal_odszumiony = odszumianie(y, okno_filtra)
    % y - sygnał do odszumiania
    % okno_filtra - rozmiar okna filtra medianowego

    % Sprawdź poprawność rozmiaru okna filtra
    if mod(okno_filtra, 2) == 0
        error('Rozmiar okna filtra musi być liczbą nieparzystą.');
    end

    % Zastosuj filtrację medianową
    sygnal_odszumiony = medfilt1(y, okno_filtra);
end