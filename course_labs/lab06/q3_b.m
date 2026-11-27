clearvars;
clc;


X = [-1, -0.5, 0, 0.5];
Y = [0.86199480, 0.95802009, 1.0986123, 1.2943767];

root = lagrange(X,Y,0.25);
fprintf('Approximated Value of f(0.25) = %.8f\n', root)
