function y = parametrik_kare_dalga(riseTime, fallTime, period, t,amplitude,amplitudeMin)
    % riseTime : Yükselme zamanı
    % fallTime : Düşme zamanı
    % period   : Kare dalganın periyodu
    % t        : Zaman vektörü
    
    % Kare dalganın yüksekliği
    % amplitude = 1;
    
    % Yükselme bölgesini tanımla
    rise_slope = (amplitude-amplitudeMin) / riseTime;
    
    % Düşme bölgesini tanımla
    fall_slope = -(amplitude-amplitudeMin) / fallTime;
    
    % Tek bir periyod için zaman vektörünü oluştur
    t_per = mod(t, period);
    
    % Kare dalgayı başlat
    y = zeros(size(t));
    % emirhan
    a = period/2 - (riseTime+fallTime)/2;
    % Zamanın hangi bölgede olduğunu belirle ve ona göre dalga üret
    for i = 1:length(t)
        if t_per(i) < riseTime
            % Yükselme zamanı
            y(i) = amplitudeMin + rise_slope * t_per(i);
        elseif t_per(i) < ( riseTime + a)
            % Yüksek durumda
            y(i) = amplitude;
        elseif t_per(i) < ( riseTime+ a + fallTime)
            % Düşme zamanı
            y(i) = amplitude + fall_slope * (t_per(i) - (riseTime + a));
        else
            y(i) = amplitudeMin;
        end
    end
end
