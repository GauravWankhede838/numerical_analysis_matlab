function [out] = hermite_interpolation(x,y,z,in)

table = hermite_interpolation_table(x,y,z);

n = length(x);

X = zeros(1,2*n);

for i = 1:(2*n)
    if mod(i,2) == 1
        X(i) = x((i+1)/2);
    else
        X(i) = x(i/2);
    end
end

out = table(1,1);

prod = 1;

for i = 2:(2*n)
    prod = prod * (in - X(i-1));
    out = out + table(1,i) * prod;
end

end