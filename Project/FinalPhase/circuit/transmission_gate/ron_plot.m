close all;

%% Read data from CSV in the same folder
M = csvread('ron.csv', 1, 0);
t = M(:, 1);
index = t > 10e-6;
v1 = M(index, 2);
v2 = M(index, 4);
i = M(index, 6);
r = (v1-v2)./i;

disp(max(r(v1 > 0.01)));

%% Generate plot
plot(v1, r);
xlabel('Voltage (V)');
ylabel('R_{on} (\Omega)');
xlim([0.01, 1.2]);
grid on;

saveas(gcf, 'ron.eps', 'epsc');
