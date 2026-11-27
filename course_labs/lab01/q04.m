A = rand(4,4);
B = rand(4,4);

M1 = A*B;                       % A*B
M2 = (inv(A*B))';               % (inv(A*B))'
M3 = inv((A*B)');               % inv((A*B)')
M4 = B'*A';                     % B'*A'
M5 = inv(inv(B)*inv(A));        % inv(inv(B)*inv(A))
M6 = (B'*A')';                  % (B'*A')'
M7 = inv(A+B);                  % inv(A+B)
M8 = inv(A) + inv(B);           % inv(A) + inv(B)
M9 = (A*B)';                    % (A*B)'

% Theory:

%   M2 == M3                    (inv(X)' = inv(X')  for any invertible matrix X)

%   M4 == M9                    (Property of Transpose: (AB)' = B'A')

%   M4 == M5                    (inv(B)*inv(A) = inv(A*B) and B'A' = (AB)', actually more precisely: M5 = inv(inv(B)*inv(A)) = A*B = M1)

%   M6 == M9                    ((B'A')' = A*B, Let's just check numerically below)

%  (inv(A+B) ~= inv(A)+inv(B))  (M7 is NOT equal to M8 in general) 

% Verify numerically - "if two things are equal, their difference is 0"

fprintf('M2 - M3 (should be ~0):\n'); disp(M2 - M3)
fprintf('M4 - M9 (should be ~0):\n'); disp(M4 - M9)
fprintf('M1 - M5 (should be ~0):\n'); disp(M1 - M5)
fprintf('M6 - M1 (should be ~0):\n'); disp(M6 - M1)
fprintf('M7 - M8 (generally NOT 0):\n'); disp(M7 - M8)
