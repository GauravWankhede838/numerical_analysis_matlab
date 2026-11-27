val = cos(pi/2);
fprintf('cos(pi/2) = %.20f\n', val);

% Explanation: MATLAB's "pi" is only a finite double-precision, ~15-16 significant digit
% FLOATING-POINT APPROXIMATION of the true irrational number pi. 
% Since pi/2 fed to cos() is not the exact mathematical value, the result is not exactly 0.
% It's an extremely small number (on the order of 1e-16) due to this rounding/truncation error inherent to finite-precision arithmetic.
