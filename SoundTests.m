x = wgn(50000,1,1);
fc = 300;
fs = 1000;

[b,a] = butter(6,fc/(fs/2));
freqz(b,a)

dataIn = randn(1000,1);
dataOut = filter(b,a,x);
