clearvars;
clc;

f = @(x) x^5 - x^4 + 7*x^3 - 5*x^2 + 4*x - 4;
g = @(x) x^2 - 3*x + 2;

tol = 1e-4;
maxit = 1e4;

root1 = muller_method(f,0,0.5,1,tol,maxit);
fprintf('Root_1 = %s\n',num2str(root1,'%.4f'));

f = @(x) f(x)/(x - root1);
root2 = muller_method(f,-3,-2,-2.1,tol,maxit);
fprintf('Root_2 = %s\n',num2str(root2,'%.4f'));

f = @(x) f(x)/(x - root2);
root3 = muller_method(f,-3,-2,-2.1,tol,maxit);
fprintf('Root_3 = %s\n',num2str(root3,'%.4f'));

f = @(x) f(x)/(x - root3);
root4 = muller_method(f,-3,-2,-2.1,tol,maxit);
fprintf('Root_4 = %s\n',num2str(root4,'%.4f'));

f = @(x) f(x)/(x - root4);
root5 = muller_method(f,-3,-2,-2.1,tol,maxit);
fprintf('Root_5 = %s\n',num2str(root5,'%.4f'));