function [root] = bisection(f,a,b,eps,maxit)

if f(a)*f(b) > 0
    root  = nan;
elseif f(a) == 0
    root = a;
elseif f(b) == 0
    root = b;
else
    it = 1;
    while (b-a)/2 > eps && it <= maxit
        c = (a+b)/2;
        fprintf('%2d\t%.6f\t%.6f\t%.6f\t.%6f\n',it,a,b,c,f(c));
        if f(c) == 0
            root = c;
            return;
        elseif f(a)*f(c) < 0
            b = c;
        else
            a = c;
        end
        it = it + 1;
    end
    root = (a+b)/2;
end

end