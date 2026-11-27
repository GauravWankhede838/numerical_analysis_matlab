M = magic(4);
[V, D] = eig(M);         % V: eigenvector matrix, D: diagonal eigenvalue matrix
N = V*D*inv(V);          % Reconstruct M from its eigen-decomposition

disp('M:'); 
disp(M)
disp('N = V*D*inv(V):'); 
disp(N)
disp('M - N (should be ~0 up to numerical round-off):'); disp(M - N)

% Explanation: eig(M) satisfies M*V = V*D, i.e. M = V*D*inv(V) whenever V is invertible (M is diagonalizable).

% magic(4) is singular (rank 3), so V may be poorly conditioned.

% M - N might show small numerical error rather than being exactly zero, but should still be extremely close to M.
