r = 10;
theta = linspace(0, 2*pi, 200);
cx = r*cos(theta);
cy = r*sin(theta);

figure;
plot(cx, cy, 'g-', 'LineWidth', 2);
axis equal;
grid on;
title('Circle of radius 10');
