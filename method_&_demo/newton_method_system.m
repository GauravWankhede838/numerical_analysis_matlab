function [root] = newton_method_system(fs,vars,x0,tol,maxit)

F = matlabFunction(fs,'Vars',{vars(:)});

Js = jacobian(fs,vars);
J  = matlabFunction(Js,'Vars',{vars(:)}); 

iter = 1;

while iter <= maxit
    if cond(J(x0)) > 1e12
        error('Jacobian is nearly singular at x0 = %s.\n',mat2str(x0));
    end
    x1 = x0 - J(x0)\F(x0);
    err = norm(x1 - x0);
    fprintf('%d\t\t%s\t\t%s\t\t%.9f\n',iter,mat2str(x0,7),mat2str(x1,7),err);
    if err < tol
        root = x1;
        return;
    end
    x0 = x1;
    iter = iter + 1;
end

error('The Newton Method cannot converge in maximum iterations.');

end