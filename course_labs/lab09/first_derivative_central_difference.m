function [res] = first_derivative_central_difference(f,a,h)

res = (f(a+h) - f(a-h))/(2*h);

end