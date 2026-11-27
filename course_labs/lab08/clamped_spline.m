function [y_val,y1_val] = clamped_spline(X,Y,a,c,x_val)

n = length(X);

h = zeros(1,n-1);

for i = 1:(n-1)
    h(i) = X(i+1) - X(i);
end

matrix = zeros(n);

for i = 1:n
    if i == 1
      matrix(i,1) = 2*h(1);
      matrix(i,2) = h(1);
      
    elseif i == n
        matrix(i,n-1) = h(n-1); 
        matrix(i,n)   = 2*h(n-1);
     
    else
        matrix(i,i-1) = h(i-1);
        matrix(i,i)   = 2*(h(i-1)+h(i));
        matrix(i,i+1) = h(i);
    end

end

b = zeros(1,n);

for i = 1:n
    if i == 1
        b(i) = 6*((Y(2) - Y(1))/h(1) - a);
    elseif i == n
        b(i) = 6*(c - (Y(n) - Y(n-1))/h(n-1));
    else
        b(i) = 6*(((Y(i+1) - Y(i))/h(i))  - ((Y(i)-Y(i-1))/h(i-1)));
    end

end

result = matrix\b';

A = Y(1:n-1);
B = zeros(1,n-1);
C = zeros(1,n-1);
D = zeros(1,n-1);

for i = 1:(n-1)
    B(i) = ((Y(i+1) - Y(i))/h(i)) - (h(i)/6 * (2*result(i) + result(i+1)));
    C(i) = result(i)/2;
    D(i) = (result(i+1) - result(i))/(6 * h(i));
end

id = 0;

for i = 1:n
    if x_val <= X(i)
        id = i;
        break;
    end
end


y_val = A(id - 1) + B(id -1)*(x_val - X(id - 1)) + C(id - 1)*(x_val - X(id - 1))^2 + D(id - 1)*(x_val - X(id - 1))^3;

y1_val =  B(id -1) + 2*C(id - 1)*(x_val - X(id - 1)) + 3*D(id - 1)*(x_val - X(id - 1))^2;

