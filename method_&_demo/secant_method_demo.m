clearvars;

clc;

f = @(x) exp(x) - 2^(-x) + 2 * cos(x) - 6;
x0 = 0;
x1 = 1;
tol = 1e-5;
maxit = 1e6;

secant_method(f,x0,x1,tol,maxit);