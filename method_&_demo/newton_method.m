function [root] = newton_method(f,df,x0,tol,maxit)

iter = 1;

fprintf('Iter\t\tx0\t\tx1\t\tError\n');

while iter <= maxit
    
    if df(x0) == 0
        error('The derivative is zero at x = %.6f.\n',x0);
    else
        x1 = x0 - f(x0)/df(x0);
        err = abs(x1 - x0);
        fprintf('%d\t\t%.6f\t\t%.6f\t\t%.6f\n',iter,x0,x1,err);
        if err < tol
            root = x1;
        return
        end

        x0 = x1;

        iter = iter + 1;

    end

end

error('Newton Method does not converge in maximum iterations');

end