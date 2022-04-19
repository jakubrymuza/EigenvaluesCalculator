function [eigv,reps,err] = mn2proj3_test(i,j,s,n,eps,reps_max)
% Autor: Jakub Rymuza
% funkcja znajduje najwi�ksz� (co do warto�ci bezwzgl�dnej) warto�� w�asn�
% macierzy rozrzedzonej n na n, za pomoc� metody pot�gowej z normowaniem
%
% macierz rozrzedzona zapisana jest w formie wektor�w i, j, s, takich �e
% element macierzy o wsp�rz�dnych (i(k),j(k)) ma warto�� s(k), k = 1,2,...
%
% WERSJA POPRAWIONA

px = rand(n,1); % wektor pocz�tkowy
peigv = 1;
eigv = 0;
err = 1000;
reps = 0;

while err>eps && reps<reps_max
    npx = px/norm(px);
    x = multiplySparse(i,j,s,n,npx); % nowe przybli�enie wek. w�.
    px = x;
    
    peigv = eigv;
    eigv = npx'*x; % nowe przybli�enie wart. w�.
    err = abs((eigv-peigv)/eigv);
    reps = reps+1;
end

