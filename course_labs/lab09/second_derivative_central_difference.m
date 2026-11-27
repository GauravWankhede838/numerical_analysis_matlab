function [res] = second_derivative_central_difference(f,a,h)

res = (f(a+2*h) - 2*f(a) + f(a-2*h))/(4*h^2);

end