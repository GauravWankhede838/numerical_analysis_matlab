function res = lagrange(X,Y,x_val)

n = length(X);

res = 0;

for i = 1:n
     
    prod = 1;
      
    for j = 1:n
           
        if j ~= i
           prod = prod * (x_val - X(j))/(X(i) - X(j));
        end
        
    end
    
    res = res + Y(i) * prod;
    
end

end