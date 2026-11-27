function [root]  = gauss_seidel(G,x0,tol,maxit)
n = length(x0);
iter = 1;
while iter <= maxit
    x1  = x0;
    for i = 1:n
        g = G(x1);
        x1(i) = g(i);
    end
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