clearvars;
clc;

X = [2,3,4,5,6];
Y = [10,8,6,8,14];

[M, y_val] = forward_difference(X,Y,3.5);

display(M);

fprintf('Estimated expected number of late-arriving students in the lab 3.5 using Newton forward interpolation method is %d.\n',round(y_val));