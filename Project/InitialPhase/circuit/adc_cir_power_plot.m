%% Load data
data = csvread('power.csv', 1, 0);
time = data(:, 1) * 1e6;
power = 1.2 * -data(:, 2) * 1e6;

%% Plot power
plot(time, power);
xlabel('Time (us)');
ylabel('Power (uW)');
grid on;
saveas(gcf, 'adc_cir_power.eps', 'epsc');
