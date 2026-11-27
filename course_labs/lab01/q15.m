val1 = exp(pi);
val2 = pi^exp(1);

fprintf('e^pi = %.6f\n', val1);
fprintf('pi^e = %.6f\n', val2);

if val1 > val2
    fprintf('e^pi is larger.\n');
else
    fprintf('pi^e is larger.\n');
end