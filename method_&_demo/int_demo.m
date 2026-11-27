clearvars;

clc;

f = @(x) x * exp(-x);

a = -1;
b =  2;

left_rect   = left_rect_rule(f,a,b);

right_rect  = right_rect_rule(f,a,b);

midpoint    = midpoint_rule(f,a,b);

trapezoidal = trapezoidal_rule(f,a,b);

simpson_1_3 = simpson_1_3_rule(f,a,b);

simpson_3_8 = simpson_3_8_rule(f,a,b);

disp(left_rect);

disp(right_rect);

disp(midpoint);

disp(trapezoidal);

disp(simpson_1_3);

disp(simpson_3_8);