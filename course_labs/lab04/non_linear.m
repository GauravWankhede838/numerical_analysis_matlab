function [root] = non_linear(x,f,g11,g12,g21,g22,tol,maxit)

it = 1;

while it <= maxit

    fprintf('%d\t%.6f\t%.6f\t%.6f\n',it,x(1),x(2),norm(f(x)));

    G = [[g11(x), g12(x)];[g21(x), g22(x)]];

    if(norm(f(x)) <= tol)
        break
    end

    x = x - G\f(x);
   
    it = it + 1;

end

root = x;


