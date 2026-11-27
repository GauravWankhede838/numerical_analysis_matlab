clearvars;
clc;

X = [1,3,4,6];
Y = [47,32,30,42];

[M1, y_val_5] = divided_difference(X,Y,5);
[M2, y_val_7] = divided_difference(X,Y,7);

display(M1);

fprintf('The estimate the number of AI-assisted submissions for Lab 5 using Newton divided difference method is %d.\n',round(y_val_5));

fprintf('The estimate the number of AI-assisted submissions for Lab 7 using Newton divided difference method is %d.\n',round(y_val_7));