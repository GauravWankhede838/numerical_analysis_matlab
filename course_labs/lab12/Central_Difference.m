function [max_err, calc_err] = Central_Difference(a, b, alpha, beta, N_vals, p, q, r, answer)

max_err = zeros(1, length(N_vals));

for i = 1:length(N_vals)

    N = N_vals(i);

    h = (b - a) / N;

    t = a:h:b; 

    y = zeros(1, length(t)); 
    y(1) = alpha;
    y(end) = beta;
    
    n_int = N - 1;
    x_int = t(2:end-1);
    
    sub_diag = zeros(1, n_int - 1);
    main_diag = zeros(1, n_int);
    sup_diag = zeros(1, n_int - 1);
    rhs = zeros(1, n_int);
    
    for j = 1:n_int
        
        xj = x_int(j);
        main_diag(j) = -2 + (h^2) * q(xj);
        rhs(j) = (h^2) * r(xj);
        
        if j > 1
            sub_diag(j-1) = 1 - (h/2) * p(xj);
        end

        if j < n_int
            sup_diag(j) = 1 + (h/2) * p(xj);
        end

    end
    
    rhs(1) = rhs(1) - (1 - (h/2)*p(x_int(1))) * alpha;
    rhs(end) = rhs(end) - (1 + (h/2)*p(x_int(end))) * beta;
    
    A = diag(main_diag) + diag(sub_diag, -1) + diag(sup_diag, 1);
    y_int = A \ rhs';
    
    y(2:end-1) = y_int';
    
    err = zeros(1, length(t));

    for j = 1:length(t)
        err(j) = abs(y(j) - answer(t(j)));
    end
    
    max_err(i) = max(err);
end

    calc_err = zeros(1, length(N_vals) - 1);

    for p_idx = 1:length(calc_err)
        calc_err(p_idx) = log2(max_err(p_idx) / max_err(p_idx+1));
    end

end