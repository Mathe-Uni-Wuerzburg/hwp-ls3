% function q = message2int(m,n)
% MESSAGE2INT(m,n) wandelt einen Bin�r-Vektors im -1/1 - Format m
% in einen Integer-Vektor um, n ist die minimale Gr��e der Bin�rdarstellungen
function q = message2int(m,n)

% Wenn in der -1/1-Darstellung eine '0' auftritt, ist bei der �bertragung
% ein Fehler aufgetreten. Diese '0' wird nun zuf�llig in eine '-1' oder '1'
% umgewandelt, um sinnvoll weiterarbeiten zu k�nnen
k = find(m==0);
m(k) = round(rand(1,length(k)))*2-1;

% Umwandlung von -1/1 nach 0/1 
m(m==-1) = 0;

% Die zur Bin�rdarstellung geh�renden Zweierpotenzen
e = [n-1:-1:0];
e = 2.^e;
e = repmat(e,1,length(m)/n);

% Erzeugen der Dezimaldarstellung
m = m.*e;
k = 1;
for i = 1:n:length(m)-n-1
   q(k) = sum(m(i:i+n-1));
   k = k+1;
end


