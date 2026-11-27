tol = 1e-3;
nmax = 1000;

F = @(x,y,z) [x^2+sin(y)+z-(2+sin(1));
              exp(x)+y^2+z-(exp(1)+2);
              x*y+sin(z)-(1+sin(1))];

x = 1.1;
y = 1.1;
z = 1.1;

fprintf('\nNewton Method:\n')
fprintf(' n\tx\ty\tz\terror\n')

for n = 1:nmax

    f = F(x,y,z);

    J = [2*x cos(y) 1;
         exp(x) 2*y 1;
         y x cos(z)];

    d = -J\f;

    xn = x+d(1);
    yn = y+d(2);
    zn = z+d(3);

    error = norm([xn-x yn-y zn-z], inf);

    x = xn;
    y = yn;
    z = zn;

    fprintf('%d\t%.6f\t%.6f\t%.6f\t%.6f\n',n,x,y,z,error)

    if error < tol
        break
    end

end

fprintf('\nNewton solution:\n')
fprintf('x = %.6f\n',x)
fprintf('y = %.6f\n',y)
fprintf('z = %.6f\n',z)


x = 1.1;
y = 1.1;
z = 1.1;

w = 0.05;

fprintf('\nJacobi Method:\n')
fprintf(' n\tx\ty\tz\terror\n')

for n = 1:nmax

    f = F(x,y,z);

    xn = x-w*f(1);
    yn = y-w*f(2);
    zn = z-w*f(3);

    error = norm([xn-x yn-y zn-z], inf);

    x = xn;
    y = yn;
    z = zn;

    fprintf('%d\t%.6f\t%.6f\t%.6f\t%.6f\n',n,x,y,z,error)

    if error < tol
        break
    end

end

fprintf('\nJacobi solution:\n')
fprintf('x = %.6f\n',x)
fprintf('y = %.6f\n',y)
fprintf('z = %.6f\n',z)


x = 1.1;
y = 1.1;
z = 1.1;

w = 0.05;

fprintf('\nGauss-Seidel Method:\n')
fprintf(' n\tx\ty\tz\terror\n')

for n = 1:nmax

    xo = x;
    yo = y;
    zo = z;

    f1 = xo^2+sin(yo)+zo-(2+sin(1));
    x = xo-w*f1;

    f2 = exp(x)+yo^2+zo-(exp(1)+2);
    y = yo-w*f2;

    f3 = x*y+sin(zo)-(1+sin(1));
    z = zo-w*f3;

    error = norm([x-xo y-yo z-zo], inf);

    fprintf('%d\t%.6f\t%.6f\t%.6f\t%.6f\n',n,x,y,z,error)


    if error < tol
        break
    end

end

fprintf('\nGauss-Seidel solution:\n')
fprintf('x = %.6f\n',x)
fprintf('y = %.6f\n',y)
fprintf('z = %.6f\n',z)
