clearvars;

clc;

x = [0, 3, 5, 8, 13];
y = [0, 225, 383, 623, 993];

out = natural_spline_coe(x,y);

disp(out);