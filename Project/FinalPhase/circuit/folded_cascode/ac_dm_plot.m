close all;

%% Read data from CSV in the same folder
M = csvread('ac_dm.csv', 1, 0);
freq = M(:, 1) ./ 1000;
dbgain = 10 * log10(M(:, 2).^2 + M(:, 3).^2);
phase = 180 ./ pi .* atan2(M(:, 3), M(:, 2));

index = find(freq >= 1 & freq <= 1000000);
freq = freq(index);
dbgain = dbgain(index);
phase = phase(index);

%% Generate plot
hold on;

subplot(2, 1, 1);
plot(freq, dbgain);
xlabel('Frequency (kHz)');
ylabel('Gain (dB)');
axis([min(freq), max(freq), -50, 100]);
set(gca, 'xscale', 'log');
grid on;

subplot(2, 1, 2);
plot(freq, phase);
xlabel('Frequency (kHz)');
ylabel('Phase (degrees)');
yticks(-180:45:180);
axis([min(freq), max(freq), -180, 180]);
set(gca, 'xscale', 'log');
grid on;

saveas(gcf, 'ac_dm.eps', 'epsc');
