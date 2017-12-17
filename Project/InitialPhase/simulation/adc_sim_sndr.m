%% Constants
BW = 38220;

%% Load data
data = load('adc_sim.mat');
data = data.ans.Data;

%% Compute PSD
N = length(data);
Y = abs(fft(data, N));
power = Y.^2 * 2 / (N * (N-1));
PSD = 10 * log10(power);

%% Compute SNDR
output = power(2:BW+1);
[~, idx] = max(output);
signal = sum(output(idx-500:idx+499));
noise = sum(output) - signal;
SNDR = 10 * log10(signal / noise);
disp(SNDR);

%% Plot PSD
BW = 100000;
freq = (0:BW)/1000;
PSD = PSD(1:BW+1);
plot(freq, PSD);
xlabel('Frequency (kHz)');
ylabel('Power (dB)');
grid on;
saveas(gcf, 'adc_sim_psd.eps', 'epsc');
