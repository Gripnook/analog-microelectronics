clear all; close all; clc;

%% Read data from CSV in the same folder
M = csvread('tran_step.csv',1,0);
t = M(:,1).*1000000000;
vin = M(:,2);
vout = M(:,4);

%% Generate plot
hold on;

subplot(2,1,1);
plot(t,vin);
xlabel('Time (ns)');
ylabel('Vin (V)');
axis([min(t),max(t),0.6,0.75]);
grid on;

subplot(2,1,2);
plot(t,vout);
xlabel('Time (ns)');
ylabel('Vout (V)');
axis([min(t),max(t),0.6,0.75]);
grid on;
