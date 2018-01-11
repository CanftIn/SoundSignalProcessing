%Fs = 10000;
%bits = 16;

% noise signal
noise1=0.01*sin(2*pi*5000*t);  %high-frequency noise 
noise2=0.01*sin(2*pi*200*t);   %low-frequency noise
noise3=0.01*sin(2*pi*4000*t)+0.01*sin(2*pi*5000*t); %band stop noise
noise4=0.01*sin(2*pi*5000*t)+0.01*sin(2*pi*200*t); %band pass noise

figure(1);
subplot(243); plot(noise1);  title('noise1 signal wave'); 
noise1_frequent = fft(noise1,1200);  
%sound(noise1,Fs,bits);    %noise replay
subplot(244);  plot(f(1:600),abs(noise1_frequent(1:600))); title('noise1 signal frequency'); 

figure(1);
subplot(241); plot(noise2);  title('noise2 signal wave'); 
noise2_frequent = fft(noise2,1200);  
%sound(noise2,Fs,bits);    %noise replay
subplot(242);  plot(f(1:600),abs(noise2_frequent(1:600))); title('noise2 signal frequency'); 

figure(1);
subplot(245); plot(noise3);  title('noise3 signal wave'); 
noise3_frequent = fft(noise3,1200);  
%sound(noise3,Fs,bits);    %noise replay
subplot(246);  plot(f(1:600),abs(noise3_frequent(1:600))); title('noise3 signal frequency'); 

figure(1);
subplot(247); plot(noise4);  title('noise4 signal wave'); 
noise4_frequent = fft(noise4,1200);  
%sound(noise4,Fs,bits);    %noise replay
subplot(248);  plot(f(1:600),abs(noise4_frequent(1:600))); title('noise4 signal frequency'); 