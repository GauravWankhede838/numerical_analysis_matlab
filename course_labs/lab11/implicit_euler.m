function [] = implicit_euler(f,a,b,h,y0,sol)

m = length(h);
max_err = zeros(1,m);

for j = 1:m
    x = a:h(j):b;
    n = length(x);
    y = zeros(1,n);
    y(1) = y0;
    err = zeros(1,n);
    err(1) = 0;
    
    for i = 2:n  
        res = @(r) r - y(i-1) - h(j) * f(x(i),r);
        y(i) = newton_method(res,y(i-1),1e-6,1e3);
        err(i) = abs(sol(x(i)) - y(i));
    end
    
    fprintf('\nFor h = %.6f\n',h(j));
    fprintf('\nx\t\ty_calc\t\ty_exact\t\tError\n');
    
    for i = 1:n
        fprintf('\n%.6f\t%.6f\t%.6f\t%.6f\n',x(i),y(i),sol(x(i)),err(i));
    end
    
    max_err(j) = max(err);

    if j == m
        figure  
        plot(x, y)
        hold on
        plot(x, sol(x))
        legend('Implicit', 'Exact')
        xlabel('x')
        ylabel('y')
        grid on
        title('Implicit Euler Method')
    end

end

for i = 1:length(max_err)
    fprintf('\n%.6f\t\t%.6f\n',h(i),max_err(i));
end

output = zeros(1,m-1);

for i = 1:length(output)
    output(i) = log2(max_err(i)/max_err(i+1));
    disp(output(i));
end

end