clear all; close all; clc;

%% Read data from CSV in the same folder
M = csvread('adc_sim_freq.csv', 1, 0);
freq = M(:, 1);
sndr = M(:, 2);

%% Generate plot
plot(freq, sndr);
xlabel('Frequency (kHz)');
ylabel('SNDR (dB)');
grid on;

saveas(gcf, 'adc_sim_freq.eps', 'epsc');
