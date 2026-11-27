clearvars;

clc;

x = [1,2,3,4];
y = [1,4,9,16];

t = newton_divided_difference(x,y);

disp(t);