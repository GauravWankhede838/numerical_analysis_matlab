function [H] = hermite_polynomial(x,y,z)

n = length(x);

X = zeros(1,2*n);

for i = 1:(2*n)
    if mod(i,2) == 1
        X(i) = x((i+1)/2);
    else
        X(i) = x(i/2);
    end
end

table = hermite_interpolation_table(x,y,z);

coe = table(1,:);

H = zeros(1,2*n);

P = 1;

for i = 1:(2*n)
    H(end - numel(P) + 1 : end) = H(end - numel(P) + 1 : end) + coe(i) * P;
    P = conv(P, [1 -X(i)]);
end

end