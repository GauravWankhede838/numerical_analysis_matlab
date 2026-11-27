function [table] = newton_divided_difference(x,y)

n = length(x);

table = zeros(n);

table(:,1) = y(:);

for j = 2:n
    for i = 1:((n+1) - j)
        table(i,j) = (table(i+1,j-1) - table(i,j-1)) / (x(i+(j-1)) - x(i));
    end
end

end