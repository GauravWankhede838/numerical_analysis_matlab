function [res,err] = simpson_1_3_rule(f,a,b)

syms x

df = diff(f,x);
ddf = diff(df,x);
dddf = diff(ddf,x);
ddddf = diff(dddf,x);

res = double(((subs(f,x,a)+4*subs(f,x,(a+b)/2)+subs(f,x,b))*(b-a))/6);

x_val = linspace(a,b,1e3);
d = double(subs(abs(ddddf),x,x_val));
m = max(d);

err = (m*(b-a)^5)/2880;

end