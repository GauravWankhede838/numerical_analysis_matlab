A = [1.2969, 0.8648; 0.2161, 0.1441];
b1 = [1.2969; 0.2161];
x_a = A\b1;
disp('Part (a): x from exact b1:'); 
disp(x_a)

b2 = round(b1, 3);          % b1 rounded to 3 decimal places
x_b = A\b2;
disp('Part (b): x from rounded b2:'); 
disp(x_b)

fprintf('cond(A) = %g\n', cond(A));

% Explanation (Part c):

% b1 happens to equal the first column of A exactly, so the exact solution of A*x = b1 is x = [1; 0] - a very simple, clean answer.

% However, A is extremely ill-conditioned (cond(A) is huge, ~10^8), because its rows are nearly linearly dependent (nearly singular matrix). 

% A tiny change in b (rounding b1 to 3 decimals to get b2), therefore causes a HUGE change in the computed solution x.

% This is the hallmark of an ill-conditioned system: small input perturbations get massively amplified in the output.
