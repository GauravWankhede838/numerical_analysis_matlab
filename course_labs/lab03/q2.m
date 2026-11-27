f  = @(x) 230*x^4 + 18*x^3 + 9*x^2 - 221*x - 9;
df = @(x) 920*x^3 + 54*x^2 + 18*x - 221;

tol = 1e-6;
max_iter = 100;

disp('-1 <= x <= 0:');
[root1, iter1] = newton_method(f, df, -0.5, tol, max_iter);
fprintf('%.6f (%d iterations)\n', root1, iter1);

disp('0 <= x <= 1:');
[root2, iter2] = newton_method(f, df, 0.75, tol, max_iter);
fprintf('%.6f (%d iterations)\n', root2, iter2);