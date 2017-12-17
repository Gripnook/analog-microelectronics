clear all; close all; clc;

%% Read data from CSV in the same folder
M = csvread('adc_sim_vo.csv', 1, 0);
vo = M(:, 1);
sndr = M(:, 2);

%% Generate plot
plot(vo, sndr);
xlabel('Voltage Amplitude (V)');
ylabel('SNDR (dB)');
grid on;

saveas(gcf, 'adc_sim_vo.eps', 'epsc');
