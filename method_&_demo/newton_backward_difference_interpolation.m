function [out] = newton_backward_difference_interpolation(x,y,in)

t = newton_backward_difference(x,y);
n = length(x);
p = (in - x(n))/(x(2) - x(1));
out = t(n,1);
coe = 1;


for i = 2:n
    coe = coe * (p + i - 2) / (i-1);
    out  = out + coe * t(n,i); 
end

end