clearvars;

clc;

x = [1,2,3,4];
y = [1,8,27,64];

t = newton_forward_difference(x,y);

disp(t);