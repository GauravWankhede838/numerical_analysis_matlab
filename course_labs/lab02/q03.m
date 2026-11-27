eps = 1e-3;
maxit = 1e3;

g = @(x) (x+1)^(1/3);
x0 = 1;
root = fixed_point_iteration(g,x0,eps,maxit);
