function [root]  = jacobi(G,x0,tol,maxit)
iter = 1;
while iter <= maxit
    x1  = G(x0);
    err = norm(x1 - x0,inf);
    fprintf('%d\t\t%s\t\t%s\t\t%.3e\n', iter, mat2str(x0,8), mat2str(x1,8), err);
    if err < tol
        root = x1;
        return
    end
    x0 = x1;                  
    iter = iter + 1;
end
error('Method does not converge in maximum iterations.');
end