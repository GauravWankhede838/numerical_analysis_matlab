function [out,err] = second_central_difference(fs,vars,h,x0)

dfs  = diff(fs,vars);
ddfs = diff(dfs,vars);
ddf  = matlabFunction(ddfs,'Vars',{vars(:)});
acc  = ddf(x0);

f = matlabFunction(fs,'Vars',{vars(:)});

n = length(h);

out = zeros(1,n);
err = zeros(1,n);

for i = 1:n
    out(i) = ( f(x0 + h(i)) - 2 * f(x0) + f(x0 - h(i))) / (h(i) ^ 2);
    err(i) = abs(out(i) - acc);
end

end

