clearvars;
clc;

f = @(z) z^4 - 2* z^3 - 2*1i*z^2 + 4*1i*z;
tol = 1e-4;
maxit = 1e4;

ri = muller_method(f,-3,0.1,1,tol,maxit);
fprintf('root = %s\n',num2str(ri,'%.4f'));

