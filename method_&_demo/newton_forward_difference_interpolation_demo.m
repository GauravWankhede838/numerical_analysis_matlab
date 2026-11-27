clearvars;

clc;

x = [2,3,4,5,6];
y = [10,8,6,8,14];

in = 3.5;

out = newton_forward_difference_interpolation(x,y,in);

fprintf('The interpolated value at %.4f is %.4f.\n',in,out);
