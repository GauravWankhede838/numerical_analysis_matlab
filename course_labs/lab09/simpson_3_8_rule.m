function [res,err] = simpson_3_8_rule(f,a,b)

syms x

df = diff(f,x);
ddf = diff(df,x);
dddf = diff(ddf,x);
ddddf = diff(dddf,x);

h = (b-a)/3;

res = double(((subs(f,x,a)+3*subs(f,x,a+h)+3*subs(f,x,a+2*h)+subs(f,x,b))*(b-a))/8);

x_val = linspace(a,b,1e3);
d = double(subs(abs(ddddf),x,x_val));
m = max(d);

err = (m*(b-a)^5)/6480;

end
