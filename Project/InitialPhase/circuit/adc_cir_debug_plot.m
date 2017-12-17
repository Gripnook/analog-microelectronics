%% Load data
data = csvread('debug.csv', 1, 0);
time = data(:, 1) * 1e6;
interval = time >= 14 & time < 16;

time = time(interval);
integrator = data(interval, 2);
output = data(interval, 4);
signal = data(interval, 6);
agnd = data(interval, 8);

%% Plot power
plot(time, signal, time, output, time, integrator, time, agnd);
xlabel('Time (us)');
ylabel('Voltage (V)');
ylim([-0.1, 1.3]);
legend('ADC Input', 'ADC Output', 'Integrator Output', 'Analog Ground', 'Location', 'southeast');
grid on;
saveas(gcf, 'adc_cir_debug.eps', 'epsc');
