clearvars;
clc; 

a = 0;
b = 1;

alpha = 0;
beta = 0;

p = @(x) -4;
q = @(x) -12;
r = @(x) 3 * exp(5 * x);

answer = @(x) -(3/7) * exp(5*x) - (3/7) * ((exp(8) - exp(7)) / (1 - exp(8))) * exp(-2*x) + (3/7) * ((1 - exp(7)) / (1 - exp(8))) * exp(6*x);

N_vals = [16, 32, 64, 128, 256, 512, 1024];
h_vals = (b - a) ./ N_vals;

%(a) 

[max_err, p_cd] = Central_Difference(a, b, alpha, beta, N_vals, p, q, r, answer);

%(b) Display formatted table

fprintf('Central Difference Method Results\n');

fprintf('%-8s %-14s %-20s %-18s\n', 'N', 'Step Size h', 'Max Error (E_h)', 'Order (p_h)');

for i = 1:length(N_vals)
    if i == 1
        fprintf('%-8d 1/%-12d %-20.10e %-18s\n', N_vals(i), N_vals(i), max_err(i), '---');
    else
        fprintf('%-8d 1/%-12d %-20.10e %-18.6f\n', N_vals(i), N_vals(i), max_err(i), p_cd(i-1));
    end
end

% (c) Compute and plot exact vs numerical solution specifically for N = 64

N_plot = 64;
h64 = (b - a) / N_plot;
t64 = a:h64:b;
n_int = N_plot - 1;
x_int = t64(2:end-1);

main_diag = zeros(1, n_int);
sub_diag  = zeros(1, n_int - 1);
sup_diag  = zeros(1, n_int - 1);
rhs       = zeros(1, n_int);

for j = 1:n_int
    xj = x_int(j);
    main_diag(j) = -2 + (h64^2) * q(xj);
    rhs(j) = (h64^2) * r(xj);
    if j > 1
        sub_diag(j-1) = 1 - (h64/2) * p(xj);
    end
    if j < n_int
        sup_diag(j) = 1 + (h64/2) * p(xj);
    end
end

rhs(1)   = rhs(1)   - (1 - (h64/2)*p(x_int(1)))   * alpha;
rhs(end) = rhs(end) - (1 + (h64/2)*p(x_int(end))) * beta;

A = diag(main_diag) + diag(sub_diag, -1) + diag(sup_diag, 1);
y64 = [alpha, (A \ rhs')', beta];

figure(1);
plot(t64, answer(t64), 'k-', 'LineWidth', 1.8); hold on;
plot(t64, y64, 'ro--', 'MarkerSize', 4);
legend('Exact Solution', 'Central Difference (N = 64)', 'Location', 'best');
xlabel('x'); ylabel('y(x)');
title('Q2(c): Exact vs Numerical Solution for N = 64');
grid on;

% (d) Log-Log Plot of Max Error vs Mesh Size h

figure(2);
loglog(h_vals, max_err, 'bo-', 'LineWidth', 1.5, 'MarkerSize', 6);
legend('Central Difference (Order \approx 2)', 'Location', 'northwest');
xlabel('Mesh Size (h)'); ylabel('Maximum Absolute Error (E_h)');
title('Q2(d): Log-Log Convergence Plot for Central Difference Method');
grid on;
