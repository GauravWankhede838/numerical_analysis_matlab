function [root] = fixed_point(g, x0, tol, maxit, verbose)

if nargin < 5
    verbose = false;
end

iter = 1;

if verbose
    fprintf('Iter\t\tx0\t\tx1\t\tError\n');
end

while iter <= maxit
    x1  = g(x0);
    err = abs(x1 - x0);

    if verbose
        fprintf('%d\t\t%.6f\t\t%.6f\t\t%.3e\n', iter, x0, x1, err);
    end
    
    if err < tol
        root = x1;
        return
    end
    x0 = x1;                  
    iter = iter + 1;
end
error('Method does not converge in maximum iterations.');
end