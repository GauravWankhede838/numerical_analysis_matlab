function [M,y_val] = backward_difference(X,Y,x_val)
n = length(Y);

h = X(2) - X(1);

u = (x_val - X(n))/h;

M = zeros(n,n);

for j = 1:n

    if(j == 1)

        for i = 1:n
            M(i,j) = Y(i);
        end

    else

        for i = j:n
          M(i,j) = M(i,j-1) - M(i-1,j-1);
        end  

    end   

end


prod = 1;
y_val = 0;

for j = 1:n

    if(j == 1)

        y_val = y_val + M(n,1);

    else

        prod = prod * (u + (j-2))/(j-1);
        y_val = y_val + M(n,j) * prod;
        
    end

end