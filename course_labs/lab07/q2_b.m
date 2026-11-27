clearvars;
clc;

X = [2,3,4,5,6];
Y = [10,8,6,8,14];

[M, y_val] = backward_difference(X,Y,6.5);

disp(M);

fprintf('Estimated expected number of late-arriving students in the lab 6.5 using Newton backward interpolation method is %d.\n',round(y_val));