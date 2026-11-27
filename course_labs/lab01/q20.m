A = [4 1 0; 0 3 1; 0 0 2];      % simple 3x3 (upper triangular) test matrix

expA = expm(A);                 % matrix exponential
sqrtA = sqrtm(A);               % matrix square root
logA = logm(A);                 % matrix logarithm

disp('A:'); disp(A)
disp('expm(A) - matrix exponential:'); disp(expA)
disp('sqrtm(A) - matrix square root:'); disp(sqrtA)
disp('logm(A) - matrix logarithm:'); disp(logA)

% Sanity checks:
disp('sqrtm(A)*sqrtm(A) - A (should be ~0):'); disp(sqrtA*sqrtA - A)
disp('expm(logm(A)) - A (should be ~0):'); disp(expm(logA) - A)