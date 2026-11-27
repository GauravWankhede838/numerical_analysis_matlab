syms x1 x2 x3;

f1 = 6*x1 - 2*cos(x2 * x3) - 1;
f2 = 9*x2 + sqrt(x1^2 + sin(x3) + 1.06) + 0.9;
f3 = 60*x3 + 3*exp(-1*x1*x2) + 10*pi - 3;

f = [f1; f2; f3];

J = jacobian(f, [x1, x2, x3]);

x_vals = [0; 0; 0];

it = 1;

while it <= 1e3

    f_val = double(subs(f, [x1, x2, x3], x_vals'));

    J_val = double(subs(J, [x1, x2, x3], x_vals'));

    x0 = x_vals - J_val \ f_val;

    fprintf('%d\t%.6f\t%.6f\t%.6f\t%.6f\n',it,x_vals(1),x_vals(2),x_vals(3),max(abs(x_vals - x0)));

    if(norm(x_vals - x0) <= 1e-6)
        x_vals = x0;
        break
    end

    x_vals = x0;

    it = it + 1;

end