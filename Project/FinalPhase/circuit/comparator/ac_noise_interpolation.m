M = csvread('ac_noise.csv', 1, 0);
freq = M(:, 1);
snd = M(:, 2);

f = fittype('abs(a) + b / x');
interpolation = fit(freq, snd, f, 'Start', [1, 1]);
disp(interpolation);
