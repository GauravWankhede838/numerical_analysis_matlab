function [res] = composite_simpson_1_3_table(x, y)
    
n = length(x) - 1;
    
if mod(n, 2) ~= 0
    error('Number of subintervals must be even for Composite Simpson 1/3 rule.\n');
end

h = x(2) - x(1);

sum = 0;
 
for i = 1:(n-1)

    if mod(i, 2) == 0
       sum = sum + 2 * y(i+1);
    else
       sum = sum + 4 * y(i+1);
    end

end

res = (y(1) + y(n+1) + sum) * (h / 3);
    
end