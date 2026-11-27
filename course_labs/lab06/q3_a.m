clearvars;
clc;


X = [0.1, 0.2, 0.3, 0.4];
Y = [-0.29004986, -0.56079734, -0.81401972, -1.0526302];

root = lagrange(X,Y,0.18);
fprintf('Approximated Value of f(0.18) = %.8f\n', root)
