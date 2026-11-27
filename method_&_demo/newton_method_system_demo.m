clearvars;

clc;

syms x y 

fs = [x*y^2 + x^2*y + x^4 - 3; x^3*y^5 - 2*x^5*y - x^2 + 2];
vars = [x;y];
x0 = [1.3;0.8];
tol = 1e-6;
maxit = 1e6;
newton_method_system(fs,vars,x0,tol,maxit);
fixed_point_system(fs,vars,x0,tol,maxit);

