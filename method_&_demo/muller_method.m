function [root] = muller_method(f,x0,x1,x2,tol,maxit)

for iter = 1:maxit
    h1 = x1 - x0;
    h2 = x2 - x1;

    d1 = (f(x1) - f(x0)) / (h1);
    d2 = (f(x2) - f(x1)) / (h2);

    a = (d2 - d1) / (h1 + h2);
    b = a*h2 + d2;
    c = f(x2);

    D = sqrt(b^2 - 4*a*c);

    if abs(b - D) < abs(b + D)
        E = b + D;
    else 
        E = b - D;
    end

    x3 = x2 - 2 * c / E;

    if abs(x3 - x2) < tol || abs(f(x3)) < tol
        root = x3;
        return
    end

    x0 = x1;
    x1 = x2;
    x2 = x3;

end

error('No root in maximum iterations.');

end