function [res,err] = composite_trapezoidal_rule(f,a,b,n)

syms x

h = (b-a)/n;

df = diff(f,x);
ddf = diff(df,x);

sum = 0;

for i = 1:(n-1)
    sum = sum + subs(f,x,a+(h*i));
end

res = double((subs(f,x,a) + subs(f,x,b) + 2*sum)*(h/2));

x_val = linspace(a,b,1e3);
d = double(subs(abs(ddf),x,x_val));
m = max(d);

err = (m*(b-a)*h^2)/12;

end