tol = 1e-5;
max_iter = 100;

fb = @(x) exp(x) - 3.*x.^2;
dfb = @(x) exp(x) - 6.*x;

disp('0 <= x <= 1:');

[root_N_b1, iter_N_b1] = newton_method(fb, dfb, 0.5, tol, max_iter);
fprintf('Newton Method Root: %.6f (Iterations: %d)\n', root_N_b1, iter_N_b1);

[root_S_b1, iter_S_b1] = secant_method(fb, 0.0, 1.0, tol, max_iter);
fprintf('Secant Method Root: %.6f (Iterations: %d)\n', root_S_b1, iter_S_b1);


disp('3 <= x <= 5:');

[root_N_b2, iter_N_b2] = newton_method(fb, dfb, 4.0, tol, max_iter);
fprintf('Newton Method Root: %.6f (Iterations: %d)\n', root_N_b2, iter_N_b2);

[root_S_b2, iter_S_b2] = secant_method(fb, 3.0, 5.0, tol, max_iter);
fprintf('Secant Method Root: %.6f (Iterations: %d)\n', root_S_b2, iter_S_b2);