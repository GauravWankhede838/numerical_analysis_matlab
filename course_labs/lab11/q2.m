clearvars;

clc;

a = 0;
b = 1;
h = [1/8,1/16,1/32,1/64,1/128,1/256];

f = @(u,v) (1/(1+u.^2)) - 2 * v .^ 2;
sol = @(u) u./(1 + u.^2);
y0 = 0;

%explicit_euler(f,a,b,h,y0,sol);

%implicit_euler(f,a,b,h,y0,sol);

%trapezoidal(f,a,b,h,y0,sol);