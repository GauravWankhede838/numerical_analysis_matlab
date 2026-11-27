function [root] = secant_method(f,x0,x1,tol,maxit)

iter = 1;

while iter <= maxit
    
    if f(x0) == f(x1)
        error('f(x0) = f(x1) at x0 = %.6f.\n',x0);
    end

    x2 = x1 - ((x1 - x0)/(f(x1) - f(x0))) * f(x1);

    err = abs(x2 - x1);

    fprintf('%d\t\t%.6f\t\t%.6f\t\t%.6f\t\t%.9f\n',iter,x0,x1,x2,err);

    if err < tol
        root = x2;
        return
    end

    x0 = x1;
    x1 = x2;
    iter = iter + 1;

end

error('Secant Method does not converge in maximum iterations.');

end