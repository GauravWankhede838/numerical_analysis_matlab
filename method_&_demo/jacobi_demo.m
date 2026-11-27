clearvars;

clc;

syms x y z

vars = [x;y;z];

Fs = [x*y - z^2 - 1; x*y*z - x^2 + y^2 - 2; exp(x) - exp(y) + z - 3];
Gs = vars - Fs ./ diag(jacobian(Fs,vars));

G = matlabFunction(Gs,'Vars',{vars(:)});

tol = 1e-3;
maxit = 1e3;
x0 = [1;1;1];

newton_method_system(Fs,vars,x0,tol,maxit);

jacobi(G,x0,tol,maxit);

r  = [1.777672; 1.423961; 1.237471];
G1 = vars - Fs ./ diag(jacobian(Fs,vars));
JG = double(subs(jacobian(G1,vars), vars, r));
fprintf('norm_inf = %.3f, spectral radius = %.3f\n', norm(JG,inf), max(abs(eig(JG))));