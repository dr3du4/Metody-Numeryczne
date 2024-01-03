%Cechy
function cechy = extract_music_features(y, fs)
    
    if size(y, 2) > 1
        y = mean(y, 2);
    end

    % Parametry spektrogramu
    window_size = 1024;
    overlap = 512;
    num_bins = 40;

    [S, F, T] = spectrogram(y, window_size, overlap, window_size, fs);
    S_db = 10 * log10(abs(S) + eps);

 % Wybierz num_bins najważniejszych częstotliwości
    wybrane_indeksy = round(linspace(1, size(S_db, 1), num_bins));
    S_db_selected = S_db(wybrane_indeksy, :);

    srednia_po_czasie = mean(S_db_selected, 2);
    odchylenie_po_czasie = std(S_db_selected, 0, 2);
    maksimum_po_czasie = max(S_db_selected, [], 2);

 % Trójwymiarowy wektor cech
    cechy = cat(3, srednia_po_czasie, odchylenie_po_czasie, maksimum_po_czasie);
end