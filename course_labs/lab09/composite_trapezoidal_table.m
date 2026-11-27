function [res] = composite_trapezoidal_table(x,y)

n = length(x) - 1;

h = x(2) - x(1);

sum = 0;

for i = 1:(n-1)
    sum = sum + y(i+1);
end

res = (y(1) + y(n+1) + 2 * sum) * (h / 2);

end