function [root] = bisection_method(f,a,b,tol)

if f(a) * f(b) > 0
    error('f(a)*f(b) > 0 : Bisection Method cannot be applied.\n');

elseif f(a) * f(b) == 0
        if f(a) == 0
            root = a;
        else
            root = b;
        end 
    return

else 
    n = ceil(log2((b - a)/tol));
    
    iter = 1;
    
    fprintf('Iter\t\ta\t\tb\t\tc\t\tf(c)\n');

    while iter <= n
        
        c = (a + b)/2;
        fprintf('%d\t\t%.4f\t\t%.4f\t\t%.4f\t\t%.4f\n',iter,a,b,c,f(c));
        if f(c) == 0
            root = c;
            return
        elseif f(a)*f(c) < 0
            b = c;

        elseif f(c)*f(b) < 0
            a = c;
        end
        
        iter = iter + 1;
    end

    root = c;

end

end