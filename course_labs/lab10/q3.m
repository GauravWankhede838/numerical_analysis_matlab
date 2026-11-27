clearvars;

clc;

syms x

f = exp(-x^2)*cos(x);
a = 0;
b = 2;
n = 12;

a1 = composite_trapezoidal_rule(f,a,b,n);
a2 = composite_simpson_1_3_rule(f,a,b,n);
a3 = composite_simpson_3_8_rule(f,a,b,n);

fh = matlabFunction(f);

exact = integral(fh,a,b);

e1 = abs(exact - a1);
e2 = abs(exact - a2);
e3 = abs(exact - a3);

fprintf('Using Composite Trapezoidal rule : %.6f and error is %.6f .\n',a1,e1);
fprintf('Using Composite Simpson 1/3 rule : %.6f and error is %.6f .\n',a2,e2);
fprintf('Using Composite Simpson 3/8 rule : %.6f and error is %.6f .\n',a3,e3);