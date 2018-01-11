%Band-pass filter  
fpl4=500; 
fph4=2000; 
fsl4=700; 
fsh4=1800;  
wp4=[2*fpl4/Fs 2*fph4/Fs]; 
ws4=[2*fsl4/Fs 2*fsh4/Fs];  
X4=x+noise4';%the signal with Band-stop noise
sound(X4,Fs,bits);%play noise signal   
Y41=fft(X4,m);%fft
figure;  
subplot(321);plot(t,X4);title('Band-pass noise signal of time region');xlabel('time(s)');  
subplot(322);plot(f,abs(Y41));title('Band-pass noise signal of frequency region');xlabel('frequency(hz)'); 
wc4=(wp4+ws4)/2;  
b4=fir1(N,wc4,kaiser(N+1));
[hn4, wp4]=freqz(b4,1,512); 
subplot(323);plot(wp4/pi,20*log10(abs(hn4)));title('Band-pass filter amplitude frequency');xlabel('w'); 
subplot(324);plot(wp4/pi,unwrap(angle(hn4)));title('Band-pass filter phase frequency');xlabel('w'); 
x4get=filter(b4,1,X4); 
Y4get=fft(x4get,m); 
sound(x4get,Fs,bits);  
subplot(325);plot(t,x4get);title('The time domain diagram of the signal filter with Band-pass noise');xlabel('time(s)'); 
subplot(326);plot(f,abs(Y4get));title('The frequency domain diagram of the signal filter with Band-pass noise ');xlabel('frequency(hz)');