f = @(x) 4*x^3 + 2*x - 2;

p0 = 0;
p1 = 1;
tol = 1e-4;
max_iter = 100;

[root, iterations] = secant_method(f, p0, p1, tol, max_iter);

fprintf('Closest x value: %.4f (in %d iterations)\n', root, iterations);