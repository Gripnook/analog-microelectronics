clear all; close all; clc;

%% Read data from CSV in the same folder
M = csvread('dc_dm_zoom.csv',1,0);
vin = M(:,1).*1000;
vout = M(:,4);

%% Generate plot
hold on;
plot(vin,vout);
xlabel('Vd (mV)');
ylabel('Vout (V)');
axis([min(vin),max(vin),0,1.2]);
grid on;
