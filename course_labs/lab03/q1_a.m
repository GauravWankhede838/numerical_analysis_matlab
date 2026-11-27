tol = 1e-5;
max_iter = 100;


fa = @(x) exp(x) + 2.^(-x) + 2.*cos(x) - 6;
dfa = @(x) exp(x) - 2.^(-x).*log(2) - 2.*sin(x);

[root_N_a, iter_N_a] = newton_method(fa, dfa, 1.5, tol, max_iter);
fprintf('Newton Method Root: %.6f (Iterations: %d)\n', root_N_a, iter_N_a);

[root_S_a, iter_S_a] = secant_method(fa, 1.0, 2.0, tol, max_iter);
fprintf('Secant Method Root: %.6f (Iterations: %d)\n', root_S_a, iter_S_a);

