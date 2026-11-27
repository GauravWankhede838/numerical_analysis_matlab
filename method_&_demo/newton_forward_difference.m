function [table] = newton_forward_difference(x,y)

n = length(x);

s = x(2) - x(1);

h = zeros(1,n-1);

for i = 1:(n - 1)
    h(i) = x(i+1) - x(i);
    if abs(h(i) - s) > 1e-12
        error('The data is not equispaced.');
    end
end



table = zeros(n);

table(:,1) = y(:);

for j = 2:n
    for i = 1:((n+1) - j)
        table(i,j) = table(i+1,j-1) - table(i,j-1);
    end
end


end