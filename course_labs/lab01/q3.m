x = linspace(-10, 10, 1000);
f = 2*sin(x) + 3*sin(2*x) + 7*sin(3*x) + 5*sin(4*x);

figure;
plot(x, f, 'b-', 'LineWidth', 1.5);
grid on;
xlabel('x'); ylabel('f(x)');
title('f(x) = 2sin(x) + 3sin(2x) + 7sin(3x) + 5sin(4x)');