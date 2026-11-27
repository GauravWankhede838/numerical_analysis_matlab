function [out] = newton_forward_difference_interpolation(x,y,in)

t = newton_forward_difference(x,y);

p = (in - x(1))/(x(2) - x(1));
out = t(1,1);
coe = 1;
n = length(x);

for i = 2:n
    coe = coe * (p - i + 2) / (i-1);
    out  = out + coe * t(1,i); 
end

end