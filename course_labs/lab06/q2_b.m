clearvars;
clc;

f = @(z) exp(z) - z;
tol = 1e-4;
maxit = 1e4;

ri = muller_method(f,-1.1,0.1,1.1,tol,maxit);
fprintf('root = %s\n',num2str(ri,'%.4f'));
    