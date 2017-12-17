close all;

Fs = 10e6;
BW = 38220;
N = 20000;

data = csvread('layout_2ms_20kHz_0.84_0.36_1p.csv', 1, 0);
t = downsample(data(6:end, 1), 10);
sig = downsample(data(6:end, 2), 10);
y = downsample(data(6:end, 4), 10);
t = t(end-N+1:end);
sig = sig(end-N+1:end);
y = y(end-N+1:end);

delay = mean(grpdelay(Hlp, N));
ysig = filter(Hlp, y);

t = t(1:end-delay);
sig = sig(1:end-delay);
y = y(1:end-delay);
ysig(1:delay) = [];

n = 4;
t = t(end-n*500+1:end);
y = y(end-n*500+1:end);
sig = sig(end-n*500+1:end);
ysig = ysig(end-n*500+1:end);

m = mean(ysig);
ysig = ysig - m;
ysig = 0.4*ysig + m;

p = polyfit(sig, ysig, 1);
disp('offset')
offset = polyval(p, 0.6)-0.6;
disp(offset)
disp('gain')
gain = p(1);
disp(gain)

t = 1e6*t;
plot(t, sig, t, ysig);
xlabel('Time (us)');
ylabel('Voltage (V)');
legend('Input', 'Output');
grid on;
saveas(gcf, 'filtered_output.eps', 'epsc');

figure;
hold on;
plot(sig, ysig, 'x');
plot(sig, polyval(p, sig), 'LineWidth', 3);
xlabel('Input (V)');
ylabel('Output (V)');
legend('Data', 'Best Fit');
[x, y] = ginput;
text(x, y, ['Offset: ' num2str(1e3*offset) 'mV\newlineGain: ' num2str(gain)]);
grid on;
saveas(gcf, 'gain_error_and_offset.eps', 'epsc');

figure;
err = ysig - sig;
err = err - mean(err);
plot(sig, 1e3*err, 'x');
xlabel('Input (V)');
ylabel('Error (mV)');
grid on;
saveas(gcf, 'error.eps', 'epsc');
