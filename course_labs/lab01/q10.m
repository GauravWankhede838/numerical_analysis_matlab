p = 2; 
x = 1.5; 
y = 0.7;

% (a) x = (1 - e^-p)/(1 + e^-p)
x10a = (1 - exp(-p))/(1 + exp(-p));
fprintf('Q10(a) x = %.6f\n', x10a);

% (b) y = |x| * sin(x + pi/5)
y10b = abs(x)*sin(x + pi/5);
fprintf('Q10(b) y = %.6f\n', y10b);

% (c) z = e^(-(x+iy)) - sqrt(x^2 + y^4)
z10c = exp(-(x + 1i*y)) - sqrt(x^2 + y^4);
fprintf('Q10(c) z = %.6f%+.6fi\n', real(z10c), imag(z10c));

% (d) w = log10(x + y + z)   (using z from part c)
w10d = log10(x + y + z10c);
fprintf('Q10(d) w = %.6f%+.6fi\n', real(w10d), imag(w10d));