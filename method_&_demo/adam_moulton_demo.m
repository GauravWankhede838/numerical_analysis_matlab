clearvars; 

clc;

f = @(x,y) y - x^2 + 1;

g = @(x) (x+1).^2 - 0.5*exp(x);

[max_err, order] = adam_moulton(f,g,[0.2 0.1 0.05 0.025],0,2,0.5);

fprintf('%.3e  ', max_err); 

fprintf('\n'); disp(order);