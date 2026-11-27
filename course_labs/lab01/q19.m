C1 = [1+2i, 3-1i; 0+1i, 4];
C2 = [2-1i, 1+1i; 3, 2i];

disp('C1:'); 
disp(C1)

disp('C2:'); 
disp(C2)

disp('C1 + C2:'); 
disp(C1 + C2)

disp('C1 * C2:'); 
disp(C1 * C2)

disp("C1' (complex conjugate transpose):"); 
disp(C1')

disp("C1.' (transpose only, no conjugation):"); 
disp(C1.')

disp('abs(C1) (elementwise magnitude):'); 
disp(abs(C1))

disp('conj(C1) (elementwise conjugate):'); 
disp(conj(C1))