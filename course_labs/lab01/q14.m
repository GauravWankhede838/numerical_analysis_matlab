M = rand(5,5);
M1 = (M + M')/2;        % M1 is symmetric: (M+M')' = M'+M = M+M' = M1
e = eig(M1);            % eigenvalues of a real symmetric matrix are always real

disp('M1 (symmetric):'); 
disp(M1)
disp('Eigenvalues e of M1 (all real, since M1 is symmetric):'); 
disp(e)

% Meaning: M + M' is always symmetric for any square M, so M1 is symmetric. 
% Real symmetric matrices have guaranteed real eigenvalues and orthogonal eigenvectors.
% Unlike a general (non-symmetric) M whose eigenvalues can be complex.