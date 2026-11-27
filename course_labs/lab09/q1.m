clearvars;

clc;

f = @(x)  exp(-x)*sin(x);

df = @(x) exp(-x)*(cos(x)-sin(x));

ddf = @(x) -2 * exp(-x)*cos(x);

df1 = df(1);
df2 = ddf(1);

a = 1;

h = [0.1,0.05,0.01,0.005];

forward_diff = zeros(1,4);
forward_diff_err = zeros(1,4);

for i = 1:4
    forward_diff(i) = first_derivative_forward_difference(f,1,h(i));
    forward_diff_err(i) = abs(forward_diff(i) - df1);
end

backward_diff = zeros(1,4);
backward_diff_err = zeros(1,4);

for i = 1:4
    backward_diff(i) = first_derivative_backward_difference(f,1,h(i));
    backward_diff_err(i) = abs(backward_diff(i) - df1);
end

central_diff = zeros(1,4);
central_diff_err = zeros(1,4);

for i = 1:4
    central_diff(i) = first_derivative_central_difference(f,1,h(i));
    central_diff_err(i) = abs(central_diff(i) - df1);
end

second_diff = zeros(1,4);
second_diff_err = zeros(1,4);

for i = 1:4
    second_diff(i) = second_derivative_central_difference(f,1,h(i));
    second_diff_err(i) = abs(second_diff(i) - df2);
end

fprintf('\nFOR FORWARD DIFFERENCE : \n');
fprintf("\nh\tf'\tError\n");

for i = 1:4
    fprintf('%.4f\t%.4f\t%.4f\n',h(i),forward_diff(i),forward_diff_err(i));
end

fprintf('\nFOR BACKWARD DIFFERENCE : \n');
fprintf("\nh\tf'\tError\n");

for i = 1:4
    fprintf('%.4f\t%.4f\t%.4f\n',h(i),backward_diff(i),backward_diff_err(i));
end

fprintf('\nFOR CENTRAL DIFFERENCE : \n');
fprintf("\nh\tf'\tError\n");

for i = 1:4
    fprintf('%.4f\t%.4f\t%.4f\n',h(i),central_diff(i),central_diff_err(i));
end

fprintf('\nFOR SECOND DERIVATIVE USING CENTRAL DIFFERENCE : \n');
fprintf("\nh\tf'\tError\n");

for i = 1:4
    fprintf('%.4f\t%.4f\t%.4f\n',h(i),second_diff(i),second_diff_err(i));
end