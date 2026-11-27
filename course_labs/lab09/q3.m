clearvars;

clc;

syms x

f = 4/(1 + x^2);
a = 0;
b = 1;

n1 = 6;
n2 = 60;
n3 = 120;


[c_t_i_6,  c_t_e_6]  = composite_trapezoidal_rule(f, a, b, n1);
[s1_t_i_6, s1_t_e_6] = composite_simpson_1_3_rule(f, a, b, n1);
[s2_t_i_6, s2_t_e_6] = composite_simpson_3_8_rule(f, a, b, n1);


[c_t_i_60,  c_t_e_60]  = composite_trapezoidal_rule(f, a, b, n2);
[s1_t_i_60, s1_t_e_60] = composite_simpson_1_3_rule(f, a, b, n2);
[s2_t_i_60, s2_t_e_60] = composite_simpson_3_8_rule(f, a, b, n2);

[c_t_i_120,  c_t_e_120]  = composite_trapezoidal_rule(f, a, b, n3);
[s1_t_i_120, s1_t_e_120] = composite_simpson_1_3_rule(f, a, b, n3);
[s2_t_i_120, s2_t_e_120] = composite_simpson_3_8_rule(f, a, b, n3);


fprintf('\nFOR N = 6 : \n');
fprintf('Method\t\tIntegral\tError Bound\n');
fprintf('Trapezoidal\t%.6f\t%.4e\n', c_t_i_6, c_t_e_6);
fprintf('Simpson 1/3\t%.6f\t%.4e\n', s1_t_i_6, s1_t_e_6);
fprintf('Simpson 3/8\t%.6f\t%.4e\n', s2_t_i_6, s2_t_e_6);

fprintf('\nFOR N = 60 : \n');
fprintf('Method\t\tIntegral\tError Bound\n');
fprintf('Trapezoidal\t%.6f\t%.4e\n', c_t_i_60, c_t_e_60);
fprintf('Simpson 1/3\t%.6f\t%.4e\n', s1_t_i_60, s1_t_e_60);
fprintf('Simpson 3/8\t%.6f\t%.4e\n', s2_t_i_60, s2_t_e_60);

fprintf('\nFOR N = 120 : \n');
fprintf('Method\t\tIntegral\tError Bound\n');
fprintf('Trapezoidal\t%.6f\t%.4e\n', c_t_i_120, c_t_e_120);
fprintf('Simpson 1/3\t%.6f\t%.4e\n', s1_t_i_120, s1_t_e_120);
fprintf('Simpson 3/8\t%.6f\t%.4e\n', s2_t_i_120, s2_t_e_120);