%% Load data
data = csvread('power.csv', 1, 0);
time = data(:, 1) * 1e6;
power = 1.2 * data(:, 2) * 1e6;

peak = max(power);
average = trapz(time, power) / (max(time) - min(time));

disp('peak');
disp(peak);
disp('average');
disp(average);

index = time < 10;

%% Plot power
plot(time(index), power(index));
xlabel('Time (us)');
ylabel('Power (uW)');
grid on;
saveas(gcf, 'layout_power.eps', 'epsc');
