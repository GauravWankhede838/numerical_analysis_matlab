eps = 1e-4;
maxit = 1e4;

g = @(x) 0.5 * (x + 3/x);
x0 = 1;
root = fixed_point_iteration(g,x0,eps,maxit);
