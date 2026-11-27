function [table] = hermite_interpolation_table(x,y,z)

n = length(x);
table = zeros(2*n);

X = zeros(1,2*n);
Y = zeros(1,2*n);

for i = 1:(2*n)
    if mod(i,2) == 1
        X(i) = x((i+1)/2);
    else
        X(i) = x(i/2);
    end
end

for i = 1:(2*n)
    if mod(i,2) == 1
        Y(i) = y((i+1)/2);
    else
        Y(i) = y(i/2);
    end
end

table(:,1) = Y(:);

for j = 2:(2*n)
    if j == 2
        for i = 1:(2*n - 1)
            if mod(i,2) == 1
                table(i,j) = z((i+1)/2);
            else
                table(i,j) = (table(i+1,1) - table(i,1)) / (X(i+1) - X(i));
            end
        end
    else
        for i = 1:(2*n - j + 1)
            table(i,j) = (table(i+1,j-1) - table(i,j-1)) / (X(i+(j-1)) - X(i));
        end
    end
end    

end