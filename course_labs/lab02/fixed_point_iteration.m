function [root] = fixed_point_iteration(g, x0, tol, maxit)
    
it = 1;
x_curr = x0;

while it < maxit

    x_next = g(x_curr);
    err = abs(x_next - x_curr);
    fprintf('%2d\t%.6f\t%.6f\t%.6f\n',it,x_curr,x_next,err);
    
    if abs(x_next - x_curr) < tol
       root = x_next;
        return;
    end
    
    x_curr = x_next;
    it = it + 1;
   
end
    
    root = x_curr;
    disp('Maximum number of iterations reached.');
    
end