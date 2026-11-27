function [max_err,order] = adam_moulton(f,g,h,a,b,y0)

n = length(h);
max_err = zeros(1,n);
order = zeros(1,(n-1));

for i = 1:n

    x = a:h(i):b;

    y = zeros(1,length(x));
    y(1) = y0;

    F = zeros(1,length(x));
    F(1) = f(x(1),y(1));

    err = zeros(1,length(x));
    err(1) = 0;

    for j = 1:(length(x) - 1)

        if j < 5
            k1 = h(i) * f(x(j),y(j));
            k2 = h(i) * f(x(j) + (1/2)*h(i), y(j) + (1/2)*k1);
            k3 = h(i) * f(x(j) + (1/2)*h(i), y(j) + (1/2)*k2);
            k4 = h(i) * f(x(j) + h(i),y(j) + k3);
            y(j+1) = y(j) + (1 / 6) * (k1 + 2*k2 + 2*k3 + k4);
            F(j+1) = f(x(j+1),y(j+1));
            err(j+1) = abs(y(j+1) - g(x(j+1)));
        else
            y_pred = y(j) + (h(i)/24) * (55*F(j) - 59*F(j-1) + 37*F(j-2) - 9*F(j-3));
            F_pred = f(x(j+1),y_pred);

            y(j+1) = y(j) + (h(i)/24) * (9*F_pred + 19*F(j) - 5*F(j-1) + F(j-2));
            F(j+1) = f(x(j+1),y(j+1));
            err(j+1) = abs(y(j+1) - g(x(j+1)));
        end

    end

    max_err(i) = max(err);

end

for k = 1:(n-1)
    order(k) = log2(max_err(k) / max_err(k+1));
end

end