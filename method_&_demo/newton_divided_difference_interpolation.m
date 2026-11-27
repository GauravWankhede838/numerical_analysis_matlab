function [out] = newton_divided_difference_interpolation(x,y,in)

t = newton_divided_difference(x,y);

out = t(1,1);
prod = 1;

n = length(x);

for i = 2:n
    prod = prod * (in - x(i-1));
    out  = out + t(1,i) * prod; 
end

end