function [res,err] = rectangle_rule(f,a,b)

syms x

df = diff(f,x);

res = double(subs(f,x,a)*(b-a));

x_val = linspace(a,b,1e3);
d = double(subs(abs(df),x,x_val));
m = max(d);

err = (m*(b-a)^2)/2;

end