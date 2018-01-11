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
sound(x, Fs, bits);
y = fft(x, m); % Fourier transform for the recorded signal
f = [Fs/m] * [1:m];
t = [1:m]/Fs;
subplot(211);plot(t, x); title('original speech voice wave');xlabel('time(s)');
subplot(212);plot(f, abs(y)); title('original speech voice frequency');
xlabel('frequency(hz)')

% noise signal
noise1=0.01*sin(2*pi*5000*t);  %high-frequency noise 
noise2=0.01*sin(2*pi*200*t);   %low-frequency noise
noise3=0.01*sin(2*pi*4000*t)+0.01*sin(2*pi*5000*t); %band stop noise
noise4=0.01*sin(2*pi*5000*t)+0.01*sin(2*pi*200*t); %band open noise



fp1=2000; 
fs1=3000;
wp1=2*pi*fp1/Fs;
ws1=2*pi*fs1/Fs;
X1=x+noise1';
%sound(X1,Fs,bits);
Y11=fft(X1,m);
figure; 
subplot(321);plot(t,X1);title('high frequent noise signal of time region');xlabel('time(s)');
subplot(322);plot(f,abs(Y11));title('high frequent noise signal of frequency region');xlabel('frequency(hz)');
wc1=(wp1+ws1)/2;   
b1=fir1(N,wc1,kaiser(N+1));
[hn1, w1]=freqz(b1,1,512);   
subplot(323);plot(w1/pi,20*log10(abs(hn1)));title('low filter amplitude frequency');xlabel('w');  
subplot(324);plot(w1/pi,unwrap(angle(hn1)));title('low filter phase frequency');xlabel('w');  
x1get=filter(b1,1,X1);
Y1get=fft(x1get,m);  
sound(x1get,Fs,bits);   
subplot(325);plot(t,x1get);title('The time domain diagram of the signal filter with high frequency noise');xlabel('time(s)'); 
subplot(326);plot(f,abs(Y1get));title('The frequency domain diagram of the signal filter with high frequency noise');xlabel('frequency(hz)');