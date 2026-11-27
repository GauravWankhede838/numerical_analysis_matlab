clearvars;

clc;

syms x

f1  = x^4;

f2  = 2/(x-4);

f3  = x*sin(x);

f4  = x*exp(-x);

f = {f1,f2,f3,f4};
a = [0.5,0,0,-1];
b = [1,0.5,pi/4,2];

int_rect = zeros(1,4);
err_rect = zeros(1,4);

for i = 1:4
    [int_rect(i),err_rect(i)] = rectangle_rule(f{i},a(i),b(i));
end

int_mid = zeros(1,4);
err_mid = zeros(1,4);

for i = 1:4
    [int_mid(i),err_mid(i)] = midpoint_rule(f{i},a(i),b(i));
end

int_trap = zeros(1,4);
err_trap = zeros(1,4);

for i = 1:4
    [int_trap(i),err_trap(i)] = trapezoidal_rule(f{i},a(i),b(i));
end


int_s1 = zeros(1,4);
err_s1 = zeros(1,4);

for i = 1:4
    [int_s1(i),err_s1(i)] = simpson_1_3_rule(f{i},a(i),b(i));
end

int_s2 = zeros(1,4);
err_s2 = zeros(1,4);

for i = 1:4
    [int_s2(i),err_s2(i)] = simpson_3_8_rule(f{i},a(i),b(i));
end

fprintf('\nMIDPOINT RULE : \n');
fprintf('func\tintegral\n');

for i = 1:4
    fprintf('%d\t%.4f\n',i,int_mid(i));
end

fprintf('\nRECTANGLE RULE : \n');
fprintf('func\tintegral\n');

for i = 1:4
    fprintf('%d\t%.4f\n',i,int_rect(i));
end

fprintf('\nTRAPEZOIDAL RULE : \n');
fprintf('func\tintegral\n');

for i = 1:4
    fprintf('%d\t%.4f\n',i,int_trap(i));
end

fprintf('\nSIMPSON 1/3 RULE : \n');
fprintf('func\tintegral\n');

for i = 1:4
    fprintf('%d\t%.4f\n',i,int_s1(i));
end

fprintf('\nSIMPSON 3/8 RULE : \n');
fprintf('func\tintegral\n');

for i = 1:4
    fprintf('%d\t%.4f\n',i,int_s2(i));
end
