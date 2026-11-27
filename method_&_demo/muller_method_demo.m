clearvars;

clc;

f = @(x) x^5 - x^4 + 7 * x^3 - 5 * x^2 + 4 * x - 4;
tol = 1e-4;
maxit = 1e2;

root1 = muller_method(f,0,1,2,tol,maxit);
fprintf('Root1 = %.6f %+.6fi\n',real(root1),imag(root1));

root2 = muller_method(f,0,-1,-2,tol,maxit);
fprintf('Root2 = %.6f %+.6fi\n',real(root2),imag(root2));

root3 = muller_method(f,2,3,4,tol,maxit);
fprintf('Root3 = %.6f %+.6fi\n',real(root3),imag(root3));

root4 = muller_method(f,-3,-4,-5,tol,maxit);
fprintf('Root4 = %.6f %+.6fi\n',real(root4),imag(root4));

root5 = muller_method(f,4,5,6,tol,maxit);
fprintf('Root5 = %.6f %+.6fi\n',real(root5),imag(root5));

root = roots([1 -1 7 -5 4 -4]);

disp(root);

g = @(z) exp(z) - z;

new_root = muller_method(g,-5,-2,1,1e-4,1e2);
fprintf('new_root = %.6f %+.6fi\n',real(new_root),imag(new_root));