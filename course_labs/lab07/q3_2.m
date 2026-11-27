clearvars;
clc;

X = [1.0, 1.5, 2.0, 2.5];
Y = [2.7183, 4.4817, 7.3819, 12.1825];

[M2, y_val_2] = backward_difference(X,Y,2.25);

real_value = exp(2.25);

error_2 = abs(y_val_2 - real_value);

disp(M2);

fprintf('Estimated value of f(2.25) using Newton backward difference interpolation is %.4f.\n',y_val_2);
fprintf('Error in the estimated value of f(2.25) is %.4f.\n',error_2);