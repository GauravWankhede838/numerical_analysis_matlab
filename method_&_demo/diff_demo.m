clearvars;

clc;

syms x

vars = x;

h = [0.1, 0.05, 0.01, 0.005];

x0 = 1;

fs = exp(-x) * sin(x);

[out1,err1] = forward_difference(fs,vars,h,x0);

[out2,err2] = backward_difference(fs,vars,h,x0);

[out3,err3] = central_difference(fs,vars,h,x0);

[out4,err4] = second_central_difference(fs,vars,h,x0);

disp(out1);
disp(err1);

disp(out2);
disp(err2);

disp(out3);
disp(err3);

disp(out4);
disp(err4);




