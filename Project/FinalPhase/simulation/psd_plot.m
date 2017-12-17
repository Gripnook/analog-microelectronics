%% Constants
t = 2; % ms
BW = floor(38220 / (1000 / t));

%% Load data
data = load('results.mat');
data = data.ans.Data;
data = data(end-t*1000*10+1:end);

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
BW = floor(200000 / (1000 / t));
freq = (0:BW)/t;
PSD = PSD(1:BW+1);
plot(freq, PSD);
xlabel('Frequency (kHz)');
ylabel('Power (dB)');
grid on;
saveas(gcf, 'psd.eps', 'epsc');
