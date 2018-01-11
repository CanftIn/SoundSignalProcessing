clf;
%Original voice sample
Fs = 10000;
ts = 1/Fs; %sample interval
T = 1;
bits = 16;
N = 38;
[x, Fs, bits] = mywavread('C:\Users\CanftIn\Desktop\MATLABworkspace\nextFriday.wav');
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


%Band-stop filter 
fpl3=2000; 
fph3=8000; 
fsl3=3000; 
fsh3=7000;  
wp3=[2*fpl3/Fs 2*fph3/Fs]; 
ws3=[2*fsl3/Fs 2*fsh3/Fs];  
X3=x+noise3';%the signal with Band-stop noise
sound(X3,Fs,bits);% play noise signal 
Y31=fft(X3,m);%fft
figure;  
subplot(321);plot(t,X3);title('Band-stop noise signal of time region');xlabel('time(s)');  
subplot(322);plot(f,abs(Y31));title('Band-stop noise signal of frequency region');xlabel('frequency(hz)'); 
wc3=(wp3+ws3)/2;  
b3=fir1(N,wc3,'stop',kaiser(N+1));
[hn3, w3]=freqz(b3,1,512);  
subplot(323);plot(w3/pi,20*log10(abs(hn3)));title('Band-stop filter amplitude frequency');xlabel('w'); 
subplot(324);plot(w3/pi,unwrap(angle(hn3)));title('Band-stop filter phase frequency');xlabel('w'); 
x3get=filter(b3,1,X3); 
Y3get=fft(x3get,m); 
sound(x3get,Fs,bits);  
subplot(325);plot(t,x3get);title('The time domain diagram of the signal filter with Band-stop noise');xlabel('time(s)'); 
subplot(326);plot(f,abs(Y3get));title('The frequency domain diagram of the signal filter with Band-stop noise');xlabel('frequency(hz)');