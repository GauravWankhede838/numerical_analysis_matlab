clearvars;

clc;

x = [0, 3, 5, 8, 13];
y = [0, 225, 383, 623, 993];
z = [75, 77, 80, 74, 72];

in = 10;

out = hermite_interpolation(x,y,z,in);

fprintf('The position of the car at t = %.4f sec is %.4f.\n',in,out);

