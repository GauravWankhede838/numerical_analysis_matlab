clearvars;

clc;

syms x
fs = exp(x) - 2^(-x) + 2 * cos(x) - 6;
f = matlabFunction(fs);
df = matlabFunction(diff(fs,x));
x0 = 1;
tol = 1e-5;
maxit = 1e6;

root = newton_method(f,df,x0,tol,maxit);