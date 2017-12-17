clear all; close all; clc;

%% Read data from CSV in the same folder
M = csvread('dc_cm.csv',1,0);
vin = M(:,1);
vout = M(:,2);

%% Generate plot
hold on;
plot(vin,vout);
xlabel('Vcm (V)');
ylabel('Vout (V)');
axis([min(vin),max(vin),0,1.2]);
grid on;

saveas(gcf,'dc_cm.eps','epsc');
