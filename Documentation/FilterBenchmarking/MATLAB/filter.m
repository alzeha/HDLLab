clear
clear all
L = 441; % no of signal samples
PI = 3.1416;
CUT_FREQ = 11025;
SAMPLING_FREQ = 44100;
M = 151; 
N = M-1; % order

rng default;

t = (0:L-1)/SAMPLING_FREQ;
x = 0.6 + 0.03*(sin(2*PI*1000*t)' + sin(2*PI*2000*t)' + sin(2*PI*3000*t)' + sin(2*PI*4000*t)' + sin(2*PI*5000*t)' + sin(2*PI*6000*t)' + sin(2*PI*7000*t)' + sin(2*PI*8000*t)' + sin(2*PI*9000*t)' + sin(2*PI*10000*t)' + sin(2*PI*11000*t)' + sin(2*PI*12000*t)' + sin(2*PI*13000*t)' + sin(2*PI*14000*t)' + sin(2*PI*15000*t)' + sin(2*PI*16000*t)' + sin(2*PI*17000*t)' + sin(2*PI*18000*t)' + sin(2*PI*19000*t)' + sin(2*PI*20000*t)');
y(1) = 0;
h(M) = 0.5;

for k = 0:M-2
   h(k+1) = sin(0.5*PI*(k-N))/(PI*(k-N));
end

for n = M:441 
    y(n) = 0;
    for k = 0:M-1
       y(n) = y(n) + x(n-k) * h(k+1);
       disp(y(n));
    end
    disp("value " + (n-M) + " is " + y(n));
end

z = fft(y);
w = fft(x);

P2 = abs(z/L);
P1 = P2(1:L/2+1);

P4 = abs(w/L);
P3 = P4(1:L/2+1);

f = SAMPLING_FREQ*(0:(L/2))/L;

figure
plot(f, P1);
xlabel('f [Hz]');
grid on;
axis tight;

figure
plot(f, P3);
xlabel('f [Hz]');
grid on;
axis tight;

figure
plot(t, x, t, y, 'r', 'linewidth',1.5);
xlabel('Time (s)');
grid on;
axis tight;
