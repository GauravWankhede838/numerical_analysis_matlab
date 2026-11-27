m = 5; n = 7;
i = (1:m)';                      % column vector 1..m
Amat = i*(3*(1:n) - 1);          % outer product: (m x 1) * (1 x n) = m x n
disp('Q12. Generated matrix:'); 
disp(Amat)