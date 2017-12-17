clear all; close all; clc;

%% Read data from CSV in the same folder
M = csvread('tran_8m.csv',1,0);
t = M(:,1).*1000;
vin = M(:,4);
vout = M(:,2);

%% Generate plot
plot(t,vin,t,vout);
xlabel('Time (ms)');
ylabel('V (V)');
axis([min(t),max(t),min(vin),max(vin)]);
legend('Vin','Vout');
grid on;

saveas(gcf,'tran_8m.eps','epsc');
