function [out] = midpoint_rule(f,a,b)

out = f((a + b) / 2) * (b - a);

end