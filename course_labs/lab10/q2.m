clearvars;

clc;

syms x

f = x^2*exp(x)*cos(x);
fh = matlabFunction(f);
a = 0;
b = pi;

a1 = trapezoidal_rule(f,a,b);
a2 = simpson_1_3_rule(f,a,b);
a3 = simpson_3_8_rule(f,a,b);
a4 = gaussian_quadrature(fh,a,b,3);
 
exact = integral(fh,a,b);

e1 = abs(a1 - exact);
e2 = abs(a2 - exact);
e3 = abs(a3 - exact);
e4 = abs(a4 - exact);


fprintf('Using Trapezoidal rule : %.6f and error is %.6f .\n',a1,e1);
fprintf('Using Simpson 1/3 rule : %.6f and error is %.6f .\n',a2,e2);
fprintf('Using Simpson 3/8 rule : %.6f and error is %.6f .\n',a3,e3);
fprintf('Using Gaussian Quadrature rule : %.6f and error is %.6f .\n',a4,e4);