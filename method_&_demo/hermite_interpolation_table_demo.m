clearvars;

clc;

x = [0, 3, 5, 8, 13];
y = [0, 225, 383, 623, 993];
z = [75, 77, 80, 74, 72];

table = hermite_interpolation_table(x,y,z);

disp(table);