clearvars;
clc;

X = [0,3,5,8,13];
Y = [0, 225, 383, 623, 993];
x_val = 10;

[y_val, y1_val] = natural_spline(X,Y,x_val);

fprintf('\nUsing NATURAL SPLINE :\n');

fprintf('\nVolume of water in the tank at time t = 10 min is %.4f litre.\n',y_val);

fprintf('\nRate of filling the tank at time t = 10 min is %.4f litre/min.\n',y1_val);

a = 75;
c = 72;

[z_val, z1_val] = clamped_spline(X,Y,a,c,x_val);

fprintf('\nUsing CLAMPED SPLINE :\n');

fprintf('\nVolume of water in the tank at time t = 10 min is %.4f litre.\n',z_val);

fprintf('\nRate of filling the tank at time t = 10 min is %.4f litre/min.\n',z1_val);