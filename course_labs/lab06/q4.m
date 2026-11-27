clearvars;
clc;


X = [1, 1.1, 1.3, 1.4];

f = @(x) log(x);
Y = zeros(length(X));

for i = 1:length(Y)
    Y(i) = f(X(i));
end

z = linspace(1,1.4,1e6);
num = abs((z - 1) .* (z - 1.1) .* (z - 1.3) .* (z - 1.4));
den = 4 * z.^4;
err = num ./ den;
max_err = max(err);
fprintf('Bound for the absolute error on the interval [x0 ,x3] is %.8f . \n',max_err);



