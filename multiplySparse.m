function sol = multiplySparse(i,j,s,n,v)
% Autor: Jakub Rymuza
% funkcja mno�y macierz rozrzedzon� opisan� parametrami i, j, s, n, przez
% wektor v

m = length(i);
sol = zeros(n,1);

for k = 1:m
    sol(i(k)) = sol(i(k)) + s(k)*v(j(k));
end
