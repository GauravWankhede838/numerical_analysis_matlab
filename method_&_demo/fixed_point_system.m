function [root]  = fixed_point_system(fs,vars,x0,tol,maxit)
f = matlabFunction(fs,'Vars',{vars(:)});
Js = jacobian(fs,vars);
J = matlabFunction(Js,'Vars',{vars(:)});
A = J(x0);
if cond(A) > 1e12
    error('Jacobian is nearly singular at %s.\n',mat2str(x0));
end
G = @(v) v - A\f(v);
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