eps = 1e-3;
max = 1e3;

f = @(x) exp(x) - sin(x);
a = -4;
b = 0;
root = bisection(f,a,b,eps,max);
