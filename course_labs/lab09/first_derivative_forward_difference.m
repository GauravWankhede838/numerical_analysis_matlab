function [res] = first_derivative_forward_difference(f,a,h)

res = (f(a+h) - f(a))/h;

end