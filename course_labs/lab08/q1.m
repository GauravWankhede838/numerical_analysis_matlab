clearvars;
clc;

X = [0,3,5,8,13];
Y = [0, 225, 383, 623, 993];
Z = [75, 77, 80, 74, 72];

table = hermite_m(X,Y,Z);
[answer, x] = hermite_f(X,Y,Z);

disp(table);

coe = sym2poly(answer);

y_val = polyval(coe,10);

fprintf('\nThe position of the car at time t = 10 sec is %.4f ft.\n',y_val);

d_answer = diff(answer,x);

d_coe = sym2poly(d_answer);

speed_10 = polyval(d_coe,10);

fprintf('\nThe speed of the car at time t = 10 sec is %.4f ft/s.\n',speed_10);

input = linspace(0,13,1e3);

speed_v = polyval(d_coe,input);

f = true;

for i = 1:1e3

    if speed_v(i) > 55 * 22/15
        fprintf('\nYes. The car exceeds speed limit of 55 mi/h on the road for the first time at %.4f sec.\n',input(i));
        f = false;
        break;
    end

end

if f
       fprintf('\nNo. The car never exceeds speed limit of 55 mi/h on the road.\n');
end

max_speed = max(speed_v);

fprintf('\nThe maximum speed of the car is %.4f ft/s.\n',max_speed);