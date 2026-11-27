function [out,err] = central_difference(fs,vars,h,x0)

dfs = diff(fs,vars);
df = matlabFunction(dfs,'Vars',{vars(:)});
acc = df(x0);

f = matlabFunction(fs,'Vars',{vars(:)});

n = length(h);

out = zeros(1,n);
err = zeros(1,n);

for i = 1:n
    out(i) = ( f(x0 + h(i)) - f(x0 - h(i))) / (2 * h(i));
    err(i) = abs(out(i) - acc);
end

end

