function [p, i] = newton_method(f, df, p0, tol, max_iter)

for i = 1:max_iter

    if df(p0) == 0
        disp('Newton method failed: derivative is zero.');
        return;
    end
        
        p = p0 - f(p0) / df(p0);
        fprintf('%d\t%.6f\t%.6f\t%.6f\n',i,p0,p,abs(p-p0));
        
        if abs(p - p0) < tol
            return;
        end

        p0 = p;

end

    disp('Newton method failed to converge within the allowed iterations.');

end