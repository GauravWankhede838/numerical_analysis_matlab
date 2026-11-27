clearvars;

clc;

f = @(x) x^3 - x - 1;

g = @(x) (x + 1)^(1/3);

x0 = 1;
tol = 1e-3;
maxit = 1e3;

root = fixed_point(g,x0,tol,maxit);

