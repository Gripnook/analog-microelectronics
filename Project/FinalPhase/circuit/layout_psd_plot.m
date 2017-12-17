%% Constants
t = 2; % ms
BW = floor(38220 / (1000 / t));

%% Load data
data = csvread('layout_2ms_20kHz_0.84_0.36_1p.csv', 1, 0);
data = downsample(data(6:end, 4), 10);
data = data(end-t*1000*10:end-1);

%% Compute PSD
N = length(data);
Y = abs(fft(data, N));
power = Y.^2 * 2 / (N * (N-1));
PSD = 10 * log10(power);

%% Compute SNDR
output = power(2:BW+1);
[~, idx] = max(output);
signal = sum(output(idx:idx));
noise = sum(output) - signal;
SNDR = 10 * log10(signal / noise);
disp(SNDR);

%% Plot PSD
maxfreq = floor(200000 / (1000 / t));
freq = (0:maxfreq)/t;
PSD = PSD(1:maxfreq+1);
plot(freq, PSD);
xlabel('Frequency (kHz)');
ylabel('Power (dB)');
grid on;
saveas(gcf, 'layout_psd.eps', 'epsc');
