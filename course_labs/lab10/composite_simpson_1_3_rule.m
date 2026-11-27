function [res,err] = composite_simpson_1_3_rule(f,a,b,n)

if mod(n,2) ~= 0
    error('Number of subintervals must be even for composite Simpson 1/3 rule.\n');
end

syms x

df = diff(f,x);
ddf = diff(df,x);
dddf = diff(ddf,x);
ddddf = diff(dddf,x);

h = (b-a)/n;

sum = 0;

for i = 1:(n-1)
    
    if mod(i,2) == 0
        sum = sum + 2*subs(f,x,a+i*h);
    else
        sum = sum + 4*subs(f,x,a+i*h);
    end

end

res = double(subs(f,x,a) + subs(f,x,b) + sum)*(h/3);

x_val = linspace(a,b,1e3);
d = double(subs(abs(ddddf),x,x_val));
m = max(d);

err = (m*(b-a)*h^4)/180;

end