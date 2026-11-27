clearvars;

clc;

x = [0, 3, 5, 8, 13];
y = [0, 225, 383, 623, 993];
z = [75, 77, 80, 74, 72];

H = hermite_polynomial(x,y,z);

%disp(H);

dH = polyder(H);

%disp(dH);

ddH = polyder(dH);

eq = dH;
eq(end) = eq(end) - 80.67;
ans1 = roots(eq);
fprintf('The car exceeds speed of 55 mi/h first time at time t = %.6f sec.\n',min(abs(ans1)));

%disp(ddH);

root = roots(ddH);

[max_speed,index] = max(polyval(dH,root));

fprintf('Maximum speed of the car is %.6f ft/s at time t = %.6f sec.\n',max_speed,root(index));

