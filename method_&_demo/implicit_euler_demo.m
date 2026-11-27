clearvars;

clc;

f = @(x,y) ( 1 / (1 + x^2) ) - 2 * y^2;

g = @(x) ( x / (1 + x^2) );

h = [1/8, 1/16, 1/32, 1/64, 1/128, 1/256];

a = 0;

b = 1;

y0 = 0;

[max_err, order] = implicit_euler(f,g,h,a,b,y0);

disp(max_err);

disp(order);