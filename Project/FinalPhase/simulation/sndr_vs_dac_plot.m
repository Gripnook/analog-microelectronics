close all;

%% Read data from CSV in the same folder
M = csvread('sndr_vs_dac.csv', 1, 0);
vo = M(:, 1);
sndr = M(:, 2);

%% Generate plot
plot(vo, sndr);
xlabel('Voltage Amplitude (V)');
ylabel('SNDR (dB)');
grid on;

saveas(gcf, 'sndr_vs_dac.eps', 'epsc');
