function [y,fs] = klastryfikacja(y,fs)
    % Ekstrakcja cech
    cechy = extract_music_features(y, fs); % Zdefiniuj funkcję do ekstrakcji cech
    cechy_reshaped = reshape(cechy, size(cechy, 1), []);
    % K-means clustering
    k = 3; % liczba klastrów
    [idx, C] = kmeans(cechy_reshaped, k);
    
    
    % Wyświetl wyniki klastryzacji
    figure;
    scatter3(cechy(:, 1), cechy(:, 2), cechy(:, 3), 50, idx, 'filled');
    title('K-means Clustering');
    
    % Wyświetl centra klastrów
    hold on;
    scatter3(C(:, 1), C(:, 2), C(:, 3), 200, (1:k)', 'filled', 'MarkerEdgeColor', 'k');
    hold off;
    
    % Interpretacja klastrów
    disp('Interpretacja klastrów:');
    for i = 1:k
        indeksy_klastra = find(idx == i);
        disp(['Klaster ', num2str(i), ': ', num2str(length(indeksy_klastra)), ' próbki']);
    end
end