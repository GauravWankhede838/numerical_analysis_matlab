clearvars;

clc;

f1 = @(x) x.^2.*log(x);
f2 = @(x) exp(3.*x).*sin(2.*x);
f3 = @(x) 2./(x.^2 - 4);
f4 = @(x) (2.*x)./(x.^2 - 4);

f = {f1,f2,f3,f4};

n = [2,3,4,5];

a = [1,0,0,1];

b = [1.5,pi/4,0.35,1.6]; 

int_f1 = zeros(1,4);
int_f2 = zeros(1,4);
int_f3 = zeros(1,4);
int_f4 = zeros(1,4);

answer = [int_f1; int_f2; int_f3; int_f4];

for i = 1:4

    for j = 1:4
        
        answer(j,i) = gaussian_quadrature(f{j},a(j),b(j),n(i));
      
    end

end

names = {'(a) x^2 ln x on [1,1.5]', '(b) e^(3x) sin(2x) on [0,pi/4]', ...
         '(c) 2/(x^2-4) on [0,0.35]', '(d) 2x/(x^2-4) on [1,1.6]'};

for j = 1:4

    fprintf('For Integral %s:\n\n', names{j});

    fprintf('\t\tIntegral\n');

    for i = 1:4
        fprintf('For n = %d\t%.15f\n', n(i), answer(j,i));
    end

    fprintf('\n');

end