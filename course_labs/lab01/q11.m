M = magic(5);
P = M ./ sum(M(:));       % scale so ALL entries sum to 1, need row & col sum = 1

% Better construction: divide each row by its row sum only works if all

% row sums are equal AND all column sums are equal (true for magic squares, since every row/col/diagonal sums to the magic constant)

magic_const = sum(M(1,:));
P = M / magic_const;      % now every row and column sums to 1

disp('P (doubly stochastic matrix):'); disp(P)
disp('Row sums of P:'); disp(sum(P,2)')
disp('Column sums of P:'); disp(sum(P,1))

Q = P^8;
disp('Q = P^8:'); disp(Q)
disp('Row sums of Q (should be ~1):'); disp(sum(Q,2)')
disp('Column sums of Q (should be ~1):'); disp(sum(Q,1))
