function [out1,out2] = natural_spline_interpolation(x,y,in)

n = length(x);

coe = natural_spline_coe(x,y);

for i = 1:(n-1)
    if (in >= x(i)) && (in <= x(i+1))
        id = i;
    end
end

s = (in - x(id));

out1 = coe(id,1) + coe(id,2) * s + coe(id,3) * s^2 + coe(id,4) * s^3;

out2 = coe(id,2) + 2 * coe(id,3) * s + 3 * coe(id,4) * s^2;