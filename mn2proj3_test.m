function [eigv,reps,err] = mn2proj3_test(i,j,s,n,eps,reps_max)
% Autor: Jakub Rymuza
% funkcja znajduje najwiêksz¹ (co do wartoœci bezwzglêdnej) wartoœæ w³asn¹
% macierzy rozrzedzonej n na n, za pomoc¹ metody potêgowej z normowaniem
%
% macierz rozrzedzona zapisana jest w formie wektorów i, j, s, takich ¿e
% element macierzy o wspó³rzêdnych (i(k),j(k)) ma wartoœæ s(k), k = 1,2,...
%
% WERSJA POPRAWIONA

px = rand(n,1); % wektor pocz¹tkowy
peigv = 1;
eigv = 0;
err = 1000;
reps = 0;

while err>eps && reps<reps_max
    npx = px/norm(px);
    x = multiplySparse(i,j,s,n,npx); % nowe przybli¿enie wek. w³.
    px = x;
    
    peigv = eigv;
    eigv = npx'*x; % nowe przybli¿enie wart. w³.
    err = abs((eigv-peigv)/eigv);
    reps = reps+1;
end

