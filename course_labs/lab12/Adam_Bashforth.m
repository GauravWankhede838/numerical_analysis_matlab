function [max_err,calc_err] = Adam_Bashforth(t0,t1,y0,h,f,answer)

max_err = zeros(1,length(h));

for i = 1:length(h)

    t = t0:h(i):t1;

    y = zeros(1,length(t)); 
    y(1) = y0;

    err = zeros(1,length(y));
    err(1) = 0;

    F = zeros(1,length(y));
    F(1) = f(t(1),y(1));

    for n = 1:3
        k1 = h(i) * f(t(n),y(n));
        k2 = h(i) * f(t(n) + h(i)/2, y(n) + k1/2);
        k3 = h(i) * f(t(n) + h(i)/2, y(n) + k2/2);
        k4 = h(i) * f(t(n) + h(i), y(n) + k3);
        y(n+1) = y(n) + (1/6) * (k1 + 2*k2 + 2*k3 + k4);
        F(n+1) = f(t(n+1),y(n+1));
        err(n+1) = abs(y(n+1) - answer(t(n+1)));
    end

    for n = 4:(length(y) - 1)
        y(n+1) = y(n) + (h(i)/24)*(55*F(n) - 59*F(n-1) + 37*F(n-2) - 9*F(n-3));
        F(n+1) = f(t(n+1),y(n+1));
        err(n+1) = abs(y(n+1) - answer(t(n+1)));
    end

    max_err(i) = max(err);

end

    calc_err = zeros(1,length(h) - 1);

    for p = 1:length(calc_err)
        calc_err(p) = log2(max_err(p) / max_err(p+1));
    end

end