clear all; close all; clc;

%% Read data from CSV in the same folder
M = csvread('dc_dm.csv',1,0);
vin = M(:,1).*1000;
vout = M(:,2);

%% Generate plot
hold on;
plot(vin,vout);
xlabel('Vd (mV)');
xticks(min(vin):1:max(vin));
ylabel('Vout (V)');
axis([min(vin),max(vin),0,1.2]);
grid on;

saveas(gcf,'dc_dm.eps','epsc');
