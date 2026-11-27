clearvars;

clc;

x = [0, 0.5, 1.0, 1.5, 2.0];
y = [1, 0.8, 0.5, 0.3, 0.2];

fprintf('The value of the integral using Trapezoidal rule is %.6f.\n',composite_trapezoidal_table(x,y));

fprintf('The value of the integral using Simpson 1/3 rule is %.6f.\n',composite_simpson_1_3_table(x,y));

fprintf('The value of the integral using Simpson 3/8 rule cannot be found as number of sub-intervals is 4 that is not multiple of 3.\n');


