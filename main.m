% Parametreler
% riseTime = 0.1;  % Yükselme zamanı (saniye)
% fallTime = 0.1;  % Düşme zamanı (saniye)
% period = 1;      % Periyot (saniye)
% t = 0:0.001:5;   % Zaman vektörü (0 ile 5 saniye arasında, 1ms örneklemeyle)
% 
% % Kare dalgayı oluştur
% y = parametrik_kare_dalga(riseTime, fallTime, period, t);
% 
% % Sonucu çizdir
% plot(t, y);
% xlabel('Zaman (s)');
% ylabel('Genlik');
% title('Parametrik Kare Dalga');
% grid on;
clear all;
T = 10^-2;
Fs = 1e4; % 10 ns sampling period 100 MHz
t = [0:T/Fs:T];


amplitude = 2*10^5;
amplitudeMin = 10^5;
change = 0.1*10^(-3);
w =  parametrik_kare_dalga((10^(-15))/2,(10^(-15))/2, change, t,amplitude,amplitudeMin);

y1 = cos(w.*t);

spectrum = fft(y1,length(t));
spc = fftshift(spectrum);

fltr = zeros(1,10001);
fltr(4000:6000) =1;

ssss=ifftshift((fltr.*spc));

signalreturned=ifft(ssss,length(t));
plot(real(signalreturned))
hold on;

plot(y1);
%angle(spcfiltered) = angle(spc);
% A=ifftshift(spcfiltered);
% a=ifft(A,length(t));
% plot(a)