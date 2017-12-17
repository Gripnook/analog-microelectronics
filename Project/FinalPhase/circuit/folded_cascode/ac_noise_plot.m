close all;

%% Read data from CSV in the same folder
M = csvread('ac_noise.csv', 1, 0);
freq = M(:, 1);
snd = M(:, 2);

index = find(freq >= 10 & freq <= 1000000);
freq = freq(index);
snd = snd(index);

%% Generate plot
hold on;
plot(freq, snd);
xlabel('Frequency (Hz)');
ylabel('SND (V^2/Hz)');
axis([min(freq), max(freq), 0, max(snd)]);
set(gca, 'xscale', 'log');
grid on;

saveas(gcf, 'ac_noise.eps', 'epsc');
