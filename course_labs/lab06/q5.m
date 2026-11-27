clearvars;
clc;


X = [0.0, 0.1, 0.3, 0.6, 1.0];
Y = [-6.00000, -5.89483, -5.65014, -5.17788, -4.28172];

root1 = lagrange(X,Y,0.2);
fprintf('Approximated Value of f(0.2) with 5 points = %.8f\n', root1);

X = [X, 1.1];
Y = [Y, 3.99583];


root2 = lagrange(X,Y,0.2);
fprintf('Approximated Value 0f f(0.2) with 6 points = %.8f\n', root2);

fprintf('Change in output = %.8f\n', abs(root2 - root1));