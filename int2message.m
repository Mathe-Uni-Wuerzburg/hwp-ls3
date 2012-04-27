% function m = int2message(q,n)
% INT2MESSAGE(q,n) wandelt einen Integer-Vektor q in einen Binär-Vektor
% im -1/1 - Format um, n ist die minimale Länge der Binärdarstellungen
function m = int2message(q,n)

% Umwandlung des Vektors vom Dezimal- ins Binärformat
m(n,:) = mod(q,2);
for i = n-1:-1:1
    q = floor(q/2);
    m(i,:) = mod(q,2);
end

% Umwandeln in die gewünschte Ausgabeform
m = reshape(m,length(m)*(n),1);
m(find(m==0)) = -1;