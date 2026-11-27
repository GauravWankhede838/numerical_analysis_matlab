% (a) 5x^5 + 3x^3 + x = 0
p_a = [5 0 3 0 1 0];                    % coefficients, highest degree first
roots_a = roots(p_a);
disp('Q8(a) roots of 5x^5+3x^3+x=0:'); 
disp(roots_a)

% (b) x^9 + x = 9  ->  x^9 + x - 9 = 0
p_b = [1 0 0 0 0 0 0 0 1 -9];
roots_b = roots(p_b);
disp('Q8(b) roots of x^9+x-9=0:'); 
disp(roots_b)
% Real root only:
real_root_b = roots_b(imag(roots_b)==0);
disp('Q8(b) real root:'); 
disp(real_root_b)

% (c) Linear system:
% 3x + 5y + 7z = 9
% x - 8y + 2z = 20
% 7x + 2y - 9z = -2
A_c = [3 5 7; 1 -8 2; 7 2 -9];
b_c = [9; 20; -2];
sol_c = A_c\b_c;
disp('Q8(c) solution [x;y;z]:'); 
disp(sol_c)

% (d) Linear system:
% 12x - 8z = 5
% x + 2y + z = 11
% 9y + 19z = 39
A_d = [12 0 -8; 1 2 1; 0 9 19];
b_d = [5; 11; 39];
sol_d = A_d\b_d;
disp('Q8(d) solution [x;y;z]:'); 
disp(sol_d)
