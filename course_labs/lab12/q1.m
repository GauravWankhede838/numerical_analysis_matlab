clearvars; 
clc;

f = @(x, y) 1 - (y ./ x);
answer = @(x) (x ./ 2) + (2 ./ x);

x0 = 2;
x1 = 3;
y0 = 2;

h_vals = [1/20, 1/40, 1/80, 1/160, 1/320];

%(a)

[m_rk2, p_rk2] = RK2(x0, x1, y0, h_vals, f, answer);
[m_rk4, p_rk4] = RK4(x0, x1, y0, h_vals, f, answer);

%(b)

[m_ab4, p_ab4] = Adam_Bashforth(x0, x1, y0, h_vals, f, answer);
[m_am4, p_am4] = Adam_Moulton(x0, x1, y0, h_vals, f, answer);

% Display separate tables for each method

methods = {'RK2', 'RK4', 'Adams-Bashforth (4th Order)', 'Adams-Moulton (4th Order)'};
errors  = {m_rk2, m_rk4, m_ab4, m_am4};
orders  = {p_rk2, p_rk4, p_ab4, p_am4};

for k = 1:4
    
    fprintf('Table %d: %s\n', k, methods{k});
    
    fprintf('%-12s %-18s %-18s\n', 'Step Size h', 'Max Error (E_h)', 'Order (p_h)');
    
    E = errors{k};
    P = orders{k};

    for i = 1:length(h_vals)

        if i == 1
            fprintf('1/%-10d %-18.10e %-18s\n', round(1/h_vals(i)), E(i), '---');
        else
            fprintf('1/%-10d %-18.10e %-18.6f\n', round(1/h_vals(i)), E(i), P(i-1));
        end

    end

end

% (c) Compute trajectories at h = 1/20 for visual comparison with exact solution

h_plot = 1/20;
t = x0:h_plot:x1;
N = length(t);

y_rk2 = zeros(1, N); y_rk2(1) = y0;
y_rk4 = zeros(1, N); y_rk4(1) = y0;
y_ab4 = zeros(1, N); y_ab4(1) = y0;
y_am4 = zeros(1, N); y_am4(1) = y0;

% RK2 trajectory
for n = 1:N-1
    k1 = h_plot * f(t(n), y_rk2(n));
    k2 = h_plot * f(t(n) + h_plot, y_rk2(n) + k1);
    y_rk2(n+1) = y_rk2(n) + 0.5 * (k1 + k2);
end

% RK4 trajectory (also used for multistep startup)

F_ab = zeros(1, N); F_ab(1) = f(t(1), y0);
F_am = zeros(1, N); F_am(1) = f(t(1), y0);

for n = 1:N-1
    k1 = h_plot * f(t(n), y_rk4(n));
    k2 = h_plot * f(t(n) + h_plot/2, y_rk4(n) + k1/2);
    k3 = h_plot * f(t(n) + h_plot/2, y_rk4(n) + k2/2);
    k4 = h_plot * f(t(n) + h_plot, y_rk4(n) + k3);
    y_rk4(n+1) = y_rk4(n) + (1/6) * (k1 + 2*k2 + 2*k3 + k4);
    
    if n <= 3
        y_ab4(n+1) = y_rk4(n+1);
        y_am4(n+1) = y_rk4(n+1);
        F_ab(n+1) = f(t(n+1), y_ab4(n+1));
        F_am(n+1) = f(t(n+1), y_am4(n+1));
    end
end

% Adams-Bashforth & Adams-Moulton trajectories

for n = 4:N-1
    y_ab4(n+1) = y_ab4(n) + (h_plot/24) * (55*F_ab(n) - 59*F_ab(n-1) + 37*F_ab(n-2) - 9*F_ab(n-3));
    F_ab(n+1) = f(t(n+1), y_ab4(n+1));
    
    y_pred = y_am4(n) + (h_plot/24) * (55*F_am(n) - 59*F_am(n-1) + 37*F_am(n-2) - 9*F_am(n-3));
    F_pred = f(t(n+1), y_pred);
    y_am4(n+1) = y_am4(n) + (h_plot/24) * (9*F_pred + 19*F_am(n) - 5*F_am(n-1) + F_am(n-2));
    F_am(n+1) = f(t(n+1), y_am4(n+1));
end

figure(1);
plot(t, answer(t), 'k-', 'LineWidth', 1.8); hold on;
plot(t, y_rk2, 'ro--', 'MarkerSize', 5);
plot(t, y_rk4, 'bs-.', 'MarkerSize', 5);
plot(t, y_ab4, 'g^:', 'MarkerSize', 5);
plot(t, y_am4, 'md--', 'MarkerSize', 5);
legend('Exact Solution', 'RK2', 'RK4', 'Adams-Bashforth 4', 'Adams-Moulton 4', 'Location', 'northwest');
xlabel('x'); ylabel('y(x)');
title('Q1(c): Numerical vs Exact Solutions (h = 1/20)');
grid on;

% (d) Log-Log Convergence Plot

figure(2);
loglog(h_vals, m_rk2, 'ro-', 'LineWidth', 1.5, 'MarkerSize', 6); hold on;
loglog(h_vals, m_rk4, 'bs-', 'LineWidth', 1.5, 'MarkerSize', 6);
loglog(h_vals, m_ab4, 'g^-', 'LineWidth', 1.5, 'MarkerSize', 6);
loglog(h_vals, m_am4, 'md-', 'LineWidth', 1.5, 'MarkerSize', 6);
legend('RK2 (Order \approx 2)', 'RK4 (Order \approx 4)', ...
       'Adams-Bashforth (Order \approx 4)', 'Adams-Moulton (Order \approx 4)', ...
       'Location', 'northwest');
xlabel('Step Size (h)'); ylabel('Maximum Absolute Error (E_h)');
title('Q1(d): Log-Log Plot of Maximum Absolute Error vs Step Size');
grid on;
