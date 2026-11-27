function [max_err,order] = implicit_euler(f,g,h,a,b,y0)

n = length(h);
max_err = zeros(1,n);

for i = 1:n

    x   = a:h(i):b;
    m   = length(x);
    y   = zeros(1,m);
    err = zeros(1,m);

    y(1) = y0;
    err(1) = 0;

    for j = 2:m
        new = @(v) y(j-1) + h(i) * f(x(j),v);
        x0 = y(j-1) + h(i) * f(x(j-1),y(j-1));
        y(j) = fixed_point(new,x0,1e-6,1e3);
        err(j) = abs(y(j) - g(x(j)));
    end

    max_err(i) = max(err);

end

order = zeros(1,n-1);

for k = 1:(n-1)
    order(k) = log2(max_err(k) / max_err(k+1));
end

end