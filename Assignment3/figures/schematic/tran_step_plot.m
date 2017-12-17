clear all; close all; clc;

%% Read data from CSV in the same folder
M = csvread('tran_step.csv',1,0);
t = M(:,1).*1000000000;
vin = M(:,4);
vout = M(:,2);

%% Generate plot
plot(t,vin,t,vout);
xlabel('Time (ns)');
ylabel('V (V)');
axis([min(t),max(t),0.5,0.62]);
legend('Vin','Vout');
grid on;

saveas(gcf,'tran_step.eps','epsc');
