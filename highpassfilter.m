clf;
%Original voice sample
Fs = 10000;
ts = 1/Fs; %sample interval
T = 1;
bits = 16;
N = 38;
[x, Fs, bits] = mywavread('C:\Users\CanftIn\Desktop\MATLABworkspace\lethergo.wav');
x = x(:,1);
m = length(x);
% sound(x, Fs, bits);
y = fft(x, m); % Fourier transform for the recorded signal
f = [Fs/m] * [1:m];
t = [1:m]/Fs;
% subplot(211);plot(t, x); title('original speech voice wave');xlabel('time(s)');
% subplot(212);plot(f, abs(y)); title('original speech voice frequency');
xlabel('frequency(hz)')

% noise signal
noise1=0.01*sin(2*pi*5000*t);  %high-frequency noise 
noise2=0.01*sin(2*pi*200*t);   %low-frequency noise
noise3=0.01*sin(2*pi*4000*t)+0.01*sin(2*pi*5000*t); %band stop noise
noise4=0.01*sin(2*pi*5000*t)+0.01*sin(2*pi*200*t); %band open noise



% highpassfilter 
fp2=500; 
fs2=300;  
wp2=2*fp2/Fs; 
ws2=2*fs2/Fs;  
X2=x+noise2';% signal with low frequent noise
%sound(X2,Fs,bits);%play noise sound
Y21=fft(X2,m);%fft
figure;  
subplot(321);plot(t,X2);title('low frequent noise signal of time region');xlabel('time(s)');  
subplot(322);plot(f,abs(Y21));title('low frequent noise signal of frequency region');xlabel('frequency(hz)'); 
wc2=(wp2+ws2)/2;  
b2=fir1(N,wc2,'high',kaiser(N+1));%make kaiser to caculate high pass FIRDF b2?n? 
[hn2, w2]=freqz(b2,1,512);  
subplot(323);plot(w2/pi,20*log10(abs(hn2)));title('high filter amplitude frequency');xlabel('w'); 
subplot(324);plot(w2/pi,unwrap(angle(hn2)));title('high filter phase frequency');xlabel('w'); 
x2get=filter(b2,1,X2); 
Y2get=fft(x2get,m); 
sound(x2get,Fs,bits);  
subplot(325);plot(t,x2get);title('The time domain diagram of the signal filter with low frequency noise');xlabel('time(s)'); 
subplot(326);plot(f,abs(Y2get));title('The frequency domain diagram of the signal filter with low frequency noise');xlabel('frequency(hz)');