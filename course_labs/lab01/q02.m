A = magic(5);
disp('Original A:'); 
disp(A)

k = 3;                  % column to delete
A(:,k) = [];            % assigning [] to a row/column deletes it in place

disp('A after deleting column k (no extra variable used):'); 
disp(A)

k = 3;                  % row to delete
A(k,:) = [];            % assigning [] to a row/column deletes it in place

disp('A after deleting row k (no extra variable used):'); 
disp(A)
