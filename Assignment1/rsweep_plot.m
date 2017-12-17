clear all; close all; clc;

%% Read data from CSV in the same folder
M = csvread('rsweep.csv',1,0);
rbias = M(:,1)./1000;
id5 = -M(:,2).*1000000;

%% Generate plot
hold on;
plot(rbias,id5);
xlabel('Rbias (kOhm)');
ylabel('ID5 (uA)');
axis([min(rbias),max(rbias),50,max(id5)]);
grid on;
