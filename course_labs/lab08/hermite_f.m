function [h,x] = hermite_f(X,Y,Z)

syms x

n = length(X);

[m, new_X] = hermite_m(X,Y,Z);

h = m(1,1);

product = sym(1);

for i = 2:2*n
    product = product * (x - new_X(i-1));
    coe = m(1,i);
    h = h + coe * product;
end

h = expand(h);


end