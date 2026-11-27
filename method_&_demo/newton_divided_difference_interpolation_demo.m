clearvars;

clc;

x = [1,3,4,6];
y = [47,32,30,42];

in1 = 5;

in2 = 7;

out1 = newton_divided_difference_interpolation(x,y,in1);

out2 = newton_divided_difference_interpolation(x,y,in2);

fprintf('The interpolated value at %.4f is %.4f.\n',in1,out1);

fprintf('The interpolated value at %.4f is %.4f.\n',in2,out2);

