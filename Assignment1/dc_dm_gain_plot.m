clear all; close all; clc;

%% Read data from CSV in the same folder
M = csvread('dc_dm_zoom.csv',1,0);
vin = M(:,1).*1000;
vout = M(:,4);

diff_vin = [1;diff(vin)];
diff_vout = [0;diff(vout)]./(diff_vin./1000);
vin = vin - diff_vin(end);

%% Generate plot
hold on;
plot(vin,diff_vout);
xlabel('Vd (mV)');
ylabel('Gain (V/V)');
axis([min(vin),max(vin),0,600]);
grid on;
