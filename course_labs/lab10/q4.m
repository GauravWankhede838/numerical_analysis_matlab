clearvars;

clc;

syms x

f = (log(1+x)/(1+x^2));
a = 0;
b = 1;

n = [4,8,16,32];

m = [2,3,4,5];

c_t_ans = zeros(4,2);
c_s_1_3_ans = zeros(4,2);
g_ans = zeros(4,2);

fh = matlabFunction(f);
exact = integral(fh,a,b);


for i = 1:4

        c_t_ans(i,1) = composite_trapezoidal_rule(f,a,b,n(i));
        c_t_ans(i,2) = abs(exact - c_t_ans(i,1));

        c_s_1_3_ans(i,1) = composite_simpson_1_3_rule(f,a,b,n(i));
        c_s_1_3_ans(i,2) = abs(exact - c_s_1_3_ans(i,1));
        
        g_ans(i,1) = gaussian_quadrature(fh,a,b,m(i));
        g_ans(i,2) = abs(g_ans(i,1) - exact);

end

fprintf('For Composite Trapezoidal Rule\n');
fprintf('Integral\tError\n');
for i = 1:4
    fprintf('For n = %d\t%.6f\t%.6f\n',n(i),c_t_ans(i,1),c_t_ans(i,2));
end

fprintf('For Composite Simpson 1/3 Rule\n');
fprintf('\tIntegral\tError\n');
for i = 1:4
    fprintf('For n = %d\t%.6f\t%.6f\n',n(i),c_s_1_3_ans(i,1),c_s_1_3_ans(i,2));
end

fprintf('For Gaussian Quadrature Rule\n');
fprintf('\tIntegral\tError\n');
for i = 1:4
    fprintf('For n = %d\t%.6f\t%.6f\n',m(i),g_ans(i,1),g_ans(i,2));
end

