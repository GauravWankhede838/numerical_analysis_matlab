function [out] = simpson_3_8_rule(f,a,b)

h = (b - a) / 3;

out = (3 * h / 8) * (f(a) + 3*f(a + h) + 3*f(a + 2*h) + f(a + 3*h));

end