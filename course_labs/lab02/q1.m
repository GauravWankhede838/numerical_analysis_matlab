eps = 1e-3;
max = 1e3;

%a
fa = @(x) 2+cos(exp(x) - 2) -exp(x);
a1 = 0.5;
b2 = 1.5;
r1 = bisection(fa,a1,b2,eps,max);

%2
fb = @(x) exp(x) - x^2 + 3*x - 2;
b1 = 0;
b2 = 1;
r2 = bisection(fb,b1,b2,eps,max);

%3
fc = @(x) 2*x*cos(2*x) - (x+1)^2;

c11 = -3;
c12 = -2;
r31 = bisection(fc,c11,c12,eps,max);

c21 = -1;
c22 =  0;
r32 = bisection(fc,c21,c22,eps,max);

%4
fd = @(x) x*cos(x) - 2*x^2 + 3*x - 1;

d11 = 0.2;
d12 = 0.3;
r41 = bisection(fd,d11,d12,eps,max);

d21 =  1.2;
d22 =  1.3;
r42 = bisection(fd,d21,d22,eps,max);
