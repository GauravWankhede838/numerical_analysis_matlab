function [res,err] = composite_simpson_3_8_rule(f,a,b,n)

if mod(n,3) ~= 0
    error('Number of subintervals must be a multiple of 3 for composite Simpson 3/8 rule.\n');
end

syms x

df = diff(f,x);
ddf = diff(df,x);
dddf = diff(ddf,x);
ddddf = diff(dddf,x);

h = (b-a)/n;

sum = 0;

for i = 1:(n-1)
    
    if mod(i,3) == 0
        sum = sum + 2*subs(f,x,a+i*h);
    else
        sum = sum + 3*subs(f,x,a+i*h);
    end

end

res = double(subs(f,x,a) + subs(f,x,b) + sum)*((h*3)/8);

x_val = linspace(a,b,1e3);
d = double(subs(abs(ddddf),x,x_val));
m = max(d);

err = (m*(b-a)*h^4)/80;

end