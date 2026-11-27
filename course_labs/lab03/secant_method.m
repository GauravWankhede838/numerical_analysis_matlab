function [p, i] = secant_method(f, p0, p1, tol, max_iter)
    
q0 = f(p0);
q1 = f(p1);
    
for i = 1:max_iter

    p = p1 - q1 * (p1 - p0) / (q1 - q0);
    fprintf('%d\t%.6f\t%.6f\t%.6f\t%.6f\n',i,p0,p1,p,abs(p-p0));
       
    if abs(p - p1) < tol
        return;
    end

        p0 = p1;
        q0 = q1;
        p1 = p;
        q1 = f(p);
    
end

    disp('Secant method failed to converge within the allowed iterations.');

end