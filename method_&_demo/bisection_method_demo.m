clearvars;

clc;

f = @(x) exp(x)-sin(x);
a = -3*pi/2;
b = 0;
tol = 1e-3;

root = bisection_method(f,a,b,tol);

fprintf('Root = %.4f\n',root);