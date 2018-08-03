clear
clear all

filename_out = '/home/vhdlp4/Desktop/ErgebnisOriginal.wav';
filename_in = '/home/vhdlp4/Desktop/ErgebnisMitFilter.wav';
[Yout,FsOut] = audioread(filename_out);
[Yin,FsIn] = audioread(filename_in);

dt_in = 1/FsIn;
dt_out = 1/FsOut;

t_in = 0:dt_in:(length(Yin(:,1))*dt_in)-dt_in;
t_out = 0:dt_out:(length(Yout(:,1))*dt_out)-dt_out;

L_in = length(Yin(:,1));
L_out = length(Yout(:,1));

%IN - Channel L
figure
plot(t_in, Yin(:,1));
grid on;
axis tight;

%IN - Channel R
figure
plot(t_in, Yin(:,2));
grid on;
axis tight;


%OUT - Channel L
figure
plot(t_out, Yout(:,1));
grid on;
axis tight;

%OUT - Channel R
figure
plot(t_out, Yout(:,2));
grid on;
axis tight;

inLFFT = fft(Yin(:,1));
inRFFT = fft(Yin(:,2));
outLFFT = fft(Yout(:,1));
outRFFT = fft(Yout(:,2));


P2inL = abs(inLFFT/L_in);
P1inL = P2inL(1:L_in/2+1);

P2inR = abs(inRFFT/L_in);
P1inR = P2inR(1:L_in/2+1);

P2outL = abs(outLFFT/L_out);
P1outL = P2outL(1:L_out/2+1);

P2outR = abs(outRFFT/L_out);
P1outR = P2outR(1:L_out/2+1);

f_in = FsIn*(0:(L_in/2))/L_in;
f_out = FsOut*(0:(L_out/2))/L_out;

figure
plot(f_in, P1inL);
xlabel('f [Hz]');
set(gca, 'YScale', 'log')
grid on;
axis tight;

figure
plot(f_in, P1inR);
xlabel('f [Hz]');
set(gca, 'YScale', 'log')
grid on;
axis tight;

figure
plot(f_out, P1outL);
xlabel('f [Hz]');
set(gca, 'YScale', 'log')
grid on;
axis tight;

figure
plot(f_out, P1outR);
xlabel('f [Hz]');
set(gca, 'YScale', 'log')
grid on;
axis tight;
