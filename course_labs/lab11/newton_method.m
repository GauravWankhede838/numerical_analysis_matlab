function [p, i] = newton_method(res_func, p0, tol, max_iter)

    eps = 1e-6;

    for i = 1:max_iter

        val = res_func(p0);

        if abs(val) <= tol
            p = p0;
            return;
        end
        
        df_val = (res_func(p0 + eps) - val) / eps;
        
        if abs(df_val) < 1e-12
            disp('Newton method failed: derivative is near zero.');
            p = p0;
            return
        end
        
        p = p0 - val / df_val;
        fprintf('%d\t%.6f\t%.6f\t%.6f\n', i, p0, p, abs(p - p0));
        
        if abs(p - p0) < tol
            return
        end

        p0 = p;

    end

    disp('Newton method failed to converge within the allowed iterations.');
    p = p0;