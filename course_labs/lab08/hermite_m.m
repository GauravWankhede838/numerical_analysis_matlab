function [m,new_X] = hermite_m(X,Y,Z)

n = length(X); 

new_Y = zeros(1,2*n);

for p = 1:2*n
    if mod(p,2) == 1
        new_Y(p) = Y((p+1)/2);
    else
        new_Y(p) = Y(p/2);
    end
end

new_X = zeros(1,2*n);

for q = 1:2*n
    if mod(q,2) == 1
        new_X(q) = X((q+1)/2);
    else
        new_X(q) = X(q/2);
    end
end

m = zeros(2*n);

for j = 1:2*n

    if j == 1
        for i = 1:2*n
            m(i,j) = new_Y(i);
        end

    elseif j == 2
        for i = 1:(2*n - 1)
            if mod(i,2) == 1
                m(i,j) = Z((i+1)/2);
            else
                m(i,j) = (m(i+1,j-1) - m(i,j-1))/(new_X(i+1) - new_X(i));
            end
        end    

    else
        for i = 1:(2*n - (j - 1))
            m(i,j) = (m(i+1,j-1) - m(i,j-1))/(new_X(i+ (j - 1)) - new_X(i));
        end
    end

end



