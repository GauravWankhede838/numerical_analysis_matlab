function [root] = muller_method(f,x0,x1,x2,tol,maxit)

fprintf('%-12s  %-25s  %-25s  %-25s  %-25s  %-25s\n', 'it','x0','x1','x2','x3','Error');

for it = 1:maxit

    dx1 = x1 - x0;
    dx2 = x2 - x1;

    dy1 = f(x1) - f(x0);
    dy2 = f(x2) - f(x1);

    del01 = dy1/dx1;
    del12 = dy2/dx2;

    a = (del12 - del01)/(dx2 + dx1);
    b = dy2/dx2  + dx2 * a;
    c = f(x2);

    if abs(b + sqrt(b^2 - 4*a*c)) >= abs(b - sqrt(b^2 - 4*a*c))
        desc = b + sqrt(b^2 - 4*a*c);
    else
        desc = b - sqrt(b^2 - 4*a*c); 
    end

    x3 = x2 - (2 * c) / desc;

    fprintf('%-12d  %-25s  %-25s  %-25s  %-25s  %-12.4f\n', ...
    it, num2str(x0, '%.4f'), num2str(x1, '%.4f'), num2str(x2, '%.4f'), num2str(x3, '%.4f'), abs(f(x3)));

    if abs(x3 - x2) <= tol || abs(f(x3)) <= tol
        root = x3;
        return
    end

    x0 = x1;
    x1 = x2;
    x2 = x3;

end

root = nan;
disp('Maximum iterations reached without converging to the root.');