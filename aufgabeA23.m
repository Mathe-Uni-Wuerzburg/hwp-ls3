function c = aufgabeA23(pe) 

    clear C;

    % Daten einlesen
    [A,asample,abit] = wavread('aloha');
    [B,bsample,bbit] = wavread('ring');
    [C,csample,cbit] = wavread('run');
    
    sound(linquant(sample(B,bsample,4000),4),4000);
    
    % resample, quantisieren
    m1 = linquantmod(sample(A,asample,4000),4);
    m2 = linquantmod(sample(B,bsample,4000),4);
    m3 = linquantmod(sample(C,csample,4000),4);

    % orthogonale codes erzeugen
    HHHH = walsh(4);
    w1 = HHHH(2,:)';
    w2 = HHHH(3,:)';
    w3 = HHHH(4,:)';
    
    % alle Nachrichten auf die Länge der längsten normieren
    maxsize =  max([ max(size(m1)) max(size(m2)) max(size(m3)) ]);
    m1(max(size(m1)):maxsize) = 0;
    m2(max(size(m2)):maxsize) = 0;
    m3(max(size(m3)):maxsize) = 0;
    
    % codieren
    C = spread(m1,w1)+spread(m2,w2)+spread(m3,w3);
    
    % Zufällige bits kippen
    E = (floor(rand(maxsize*max(size(HHHH)),1) * (1 + pe)) * (-2) + 1);
    C = E .* C;
    
    % decodieren
    m1strich = despread(C,w1);
    m2strich = despread(C,w2);
    m3strich = despread(C,w3);
    
    % abspielen
    sound(relinquant(m1strich',4), 4000);
    sound(relinquant(m2strich',4), 4000);
    sound(relinquant(m3strich',4), 4000);

end