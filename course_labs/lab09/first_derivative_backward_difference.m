function [res] = first_derivative_backward_difference(f,a,h)

res = (f(a) - f(a-h))/h;

end