clearvars;

clc;

x = [0, 3, 5, 8, 13];
y = [0, 225, 383, 623, 993];
in = 10;

[out1, out2] = natural_spline_interpolation(x,y,in);

fprintf('The volume of water in the tank at t = %.6f min is %.6f litres.\n',in,out1);
fprintf('The filling rate at t = %.6f min is %.6f litre/min.\n',in,out2);