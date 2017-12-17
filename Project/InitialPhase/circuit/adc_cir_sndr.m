%% Constants
BW = floor(38220 / 500);

%% Load data
data = csvread('10M.csv', 1, 0);
data = data(end-200000:end, 2);

%% Compute PSD
N = length(data);
Y = abs(fft(data, N));
power = Y.^2 * 2 / (N * (N-1));
PSD = 10 * log10(power);

%% Compute SNDR
output = power(2:BW+1);
[~, idx] = max(output);
signal = sum(output(idx-1:idx));
noise = sum(output) - signal;
SNDR = 10 * log10(signal / noise);
disp(SNDR);

%% Plot PSD
BW = 200;
freq = (0:BW)/2;
PSD = PSD(1:BW+1);
plot(freq, PSD);
xlabel('Frequency (kHz)');
ylabel('Power (dB)');
grid on;
saveas(gcf, 'adc_cir_psd.eps', 'epsc');
