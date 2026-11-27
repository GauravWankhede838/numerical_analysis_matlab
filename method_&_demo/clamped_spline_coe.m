function [res] = clamped_spline_coe(x,y,y1,yn)

n = length(x);

h = zeros(1,n-1);

for i = 1:(n-1)
    h(i) = x(i+1) - x(i);
end

matrix = zeros(n);
b = zeros(n,1);

for i = 1:n
    if i ==1
        matrix(i,1) = 2 * h(i);
        matrix(i,2) = h(i);
        b(i,1)      = 6 * ( ((y(i+1) - y(i)) / h(i)) - y1 );
    elseif i == n
        matrix(i,n-1) = h(n-1); 
        matrix(i,n)   = 2 * h(n-1);
        b(i,1)        = 6 * ( yn - ((y(i) - y(i-1)) / h(i-1)) );
    else
        matrix(i,i-1) = h(i-1);
        matrix(i,i)   = 2 * (h(i-1) + h(i));
        matrix(i,i+1) = h(i);
        b(i,1)        = 6 * (( (y(i+1) - y(i)) / h(i)) - ((y(i) - y(i-1)) / h(i-1)));
    end
end

m = matrix \ b;

res = zeros(n-1, 4);

for i = 1:(n-1)
    res(i,1) = y(i);
    res(i,2) = ( (y(i+1) - y(i)) / h(i)) - (h(i)/6) * (2 * m(i) + m(i+1)) ;
    res(i,3) = m(i)/2;
    res(i,4) = (m(i+1) - m(i)) / (6 * h(i));
end

end