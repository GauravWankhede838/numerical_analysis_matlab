function [out] = simpson_1_3_rule(f,a,b)

h = (b - a) / 2;

out = (h / 3) * (f(a) + 4*f(a + h) + f(a + 2*h));

end