function test()
% Autor: Jakub Rymuza
% funkcja testuj¹ca

n = 4;
A = [0 1-3i 2+3i 0; 0 1 0 5-4i; 0 0 0 3+6i; 0 0 -5-i 1+2i];

calculate(A,n);

n = 2;
A = [5 0; 0 5+1e-3];

calculate(A,n);

n = 2;
A = [1 0; 0 10];

calculate(A,n);
end

function calculate(A,n)
S = sparse(A);
[ii,jj,ss] = find(S);

[eigv,reps,err] = mn2proj3_test(ii,jj,ss,n,1e-14,100000);
eigv 
reps
err

B = eig(A)
B = sort(abs(B),'descend');
abs(B(2)/B(1))
end