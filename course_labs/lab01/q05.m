n = 5;                                    % number of sides
theta = linspace(0, 2*pi, n+1) + pi/2;    % +pi/2 to point a vertex up
px = cos(theta);
py = sin(theta);

figure;
plot(px, py, 'r-o', 'LineWidth', 2);
axis equal;
grid on;
title('Regular Pentagon (5 sides)');
