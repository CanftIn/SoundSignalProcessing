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