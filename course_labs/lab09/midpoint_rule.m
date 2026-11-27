function [res,err] = midpoint_rule(f,a,b)

syms x

df = diff(f,x);
ddf = diff(df,x);

res = double(subs(f,x,(a+b)/2)*(b-a));

x_val = linspace(a,b,1e3);
d = double(subs(abs(ddf),x,x_val));
m = max(d);

err = (m*(b-a)^3)/24;

end