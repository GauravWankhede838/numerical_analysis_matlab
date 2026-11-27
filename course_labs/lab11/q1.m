clearvars;

clc;

a = 1;
b = 3;
h = [1/8,1/16,1/32,1/64,1/128,1/256];

f = @(u,v) 1 + (v/u) + (v/u)^2;
sol = @(u) u .* tan(log(u));
y0 = 0;

%explicit_euler(f,a,b,h,y0,sol);

%implicit_euler(f,a,b,h,y0,sol);

%trapezoidal(f,a,b,h,y0,sol);