clearvars;

clc;

f = @(x,y) 1 + (y/x) + (y/x)^2;

g = @(x) x * tan(log(x));

h = [1/8, 1/16, 1/32, 1/64, 1/128, 1/256];

a = 1;

b = 3;

y0 = 0;

[max_err, order] = explicit_euler(f,g,h,a,b,y0);

disp(max_err);

disp(order);