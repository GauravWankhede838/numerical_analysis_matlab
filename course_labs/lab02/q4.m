eps = 1e-5;
maxit = 1e5;

ga = @(x) (exp(x)/3)^(1/2); 
ga0 = 0;
roota = fixed_point_iteration(ga,ga0,eps,maxit);

gb = @(x) cos(x);
gb0 = 0;
rootb = fixed_point_iteration(gb,gb0,eps,maxit);

