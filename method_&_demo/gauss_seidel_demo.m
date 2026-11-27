clearvars;

clc;

syms x y z

vars = [x;y;z];

Fs = [x^2 + sin(y) + z - 2 - sin(1); exp(x) + y^2 + z - exp(1) - 2; x*y + sin(z) - 1 - sin(1)];
Gs = vars - Fs ./ diag(jacobian(Fs,vars));

G = matlabFunction(Gs,'Vars',{vars(:)});

tol = 1e-3;
maxit = 1e3;
x0 = [0.8;1.5;0.6];

newton_method_system(Fs,vars,x0,tol,maxit);

gauss_seidel(G,x0,tol,maxit);

%Jacobi(G,x0,tol,maxit);