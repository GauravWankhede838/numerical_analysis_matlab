clearvars;

clc;

x = [0, 3, 5, 8, 13];
y = [0, 225, 383, 623, 993];
y1 = 75;
yn = 72;

out = clamped_spline_coe(x,y,y1,yn);

disp(out);