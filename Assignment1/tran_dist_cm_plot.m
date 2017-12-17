clear all; close all; clc;

%% Read data from CSV in the same folder
M = csvread('tran_dist_cm.csv',1,0);
t = M(:,1).*1000;
vin = M(:,4);
vout = M(:,2);

%% Generate plot
hold on;

subplot(2,1,1);
plot(t,vin);
xlabel('Time (ms)');
ylabel('Vcm (V)');
axis([min(t),max(t),min(vin),max(vin)]);
grid on;

subplot(2,1,2);
plot(t,vout);
xlabel('Time (ms)');
ylabel('Vout (V)');
axis([min(t),max(t),min(vin),max(vin)]);
grid on;
