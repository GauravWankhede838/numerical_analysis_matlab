clearvars;

clc;

syms x y z
vars = [x,y,z];
fs = [6*x - 2*cos(y*z) - 1; 9*y + sqrt(x^2 + sin(z) + 1.06) + 0.9; 60*z + 3*exp(-x*y) + 10*pi - 3];
x0 = [0;0;0];
tol = 1e-6;
maxit = 1e3;

fixed_point_system(fs,vars,x0,tol,maxit);