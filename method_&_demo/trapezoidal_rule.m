function [out] = trapezoidal_rule(f,a,b)

out = ((f(a) + f(b)) / 2) * (b - a);

end