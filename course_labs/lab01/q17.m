A = [1 2; 3 4];
B = [5 6; 7 8];

elem_mult = A .* B;        % element wise multiplication
elem_div  = A ./ B;        % element wise division
elem_pow  = A .^ 2;        % element wise power

disp('A .* B (elementwise multiply):'); 
disp(elem_mult)
disp('A ./ B (elementwise divide):'); 
disp(elem_div)
disp('A .^ 2 (elementwise square):'); 
disp(elem_pow)

% Contrast with A*B (true matrix multiplication) to confirm they differ:
disp('A*B (matrix multiply, for comparison):'); disp(A*B)
