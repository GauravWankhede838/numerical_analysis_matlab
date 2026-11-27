function [res,err] = trapezoidal_rule(f,a,b)

syms x

df = diff(f,x);
ddf = diff(df,x);

res = double(((subs(f,x,a) + subs(f,x,b))*(b-a))/2);

x_val = linspace(a,b,1e3);
d = double(subs(abs(ddf),x,x_val));
m = max(d);

err = (m*(b-a)^3)/12;

end