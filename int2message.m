% function m = int2message(q,n)
% INT2MESSAGE(q,n) wandelt einen Integer-Vektor q in einen Bin�r-Vektor
% im -1/1 - Format um, n ist die minimale L�nge der Bin�rdarstellungen
function m = int2message(q,n)

% Umwandlung des Vektors vom Dezimal- ins Bin�rformat
m(n,:) = mod(q,2);
for i = n-1:-1:1
    q = floor(q/2);
    m(i,:) = mod(q,2);
end

% Umwandeln in die gew�nschte Ausgabeform
m = reshape(m,length(m)*(n),1);
m(find(m==0)) = -1;