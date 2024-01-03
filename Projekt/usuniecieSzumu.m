%funkcja szukająca okna filtrujacego iu odszumiajaca
function [y,fs,y_z_szumem] = usuniecieSzumu(y,y_z_szumem,fs)
    
   
    najlepszy_wynik = Inf;
    najlepszy_rozmiar_okna_filtra = 0;
    
    % Sprawdź różne rozmiary okna filtra
    for rozmiar_okna_filtra = 101:2:201  
        
        sygnal_odszumiony = odszumianie(y_z_szumem, rozmiar_okna_filtra);
    
      
        roznica = norm(y - sygnal_odszumiony);
    
        
        if roznica < najlepszy_wynik
            najlepszy_wynik = roznica;
            najlepszy_rozmiar_okna_filtra = rozmiar_okna_filtra;
        end
    end
    
    
    disp(['Najlepszy rozmiar okna filtra: ' num2str(najlepszy_rozmiar_okna_filtra)]);
    
    sygnal_odszumiony = odszumianie(y_z_szumem, najlepszy_rozmiar_okna_filtra);

end