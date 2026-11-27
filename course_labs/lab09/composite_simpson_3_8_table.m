function [res] = composite_simpson_3_8_table(x, y)
 
n = length(x) - 1;
    
if mod(n, 3) ~= 0
        error('Number of subintervals must be a multiple of 3 for Composite Simpson 3/8 rule.\n');
end
    
h = x(2) - x(1);

sum = 0;

for i = 1:(n-1)
        
    if mod(i, 3) == 0
       sum = sum + 2 * y(i+1);
    else
       sum = sum + 3 * y(i+1);
    end

end

res = (y(1) + y(n+1) + sum) * ((h * 3) / 8);
     
end