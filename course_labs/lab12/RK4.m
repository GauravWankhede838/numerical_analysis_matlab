function [max_err,calc_err] = RK4(t0,t1,y0,h,f,answer)

max_err = zeros(1,length(h));

for i = 1:length(h)
      
    t = t0:h(i):t1;

    y = zeros(1,length(t));
    y(1) = y0;

    err = zeros(1,length(y));
    err(1) = 0;


    for n = 1:(length(y) - 1)
        k1 = h(i) * f(t(n),y(n));
        k2 = h(i) * f(t(n) + h(i)/2, y(n) + k1/2);
        k3 = h(i) * f(t(n) + h(i)/2, y(n) + k2/2);
        k4 = h(i) * f(t(n) + h(i), y(n) + k3);
        y(n+1) = y(n) + (1/6) * (k1 + 2*k2 + 2*k3 + k4);
        err(n+1) = abs(answer(t(n+1)) - y(n+1));
    end

    max_err(i) = max(err);

end

calc_err = zeros(1,length(h) - 1);

for j = 1:length(calc_err)
    calc_err(j) = log2(max_err(j) / max_err(j+1));
end

end