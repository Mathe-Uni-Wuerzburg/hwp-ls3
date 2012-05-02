function aufgabeA25() 

    clear C;

    % Daten einlesen
    [A,asample,abit] = wavread('aloha');
    [B,bsample,bbit] = wavread('ring');
    [C,csample,cbit] = wavread('run');
    
    % resample, quantisieren
    m1 = linquantmod(sample(A,asample,4000),4);
    m2 = linquantmod(sample(B,bsample,4000),4);
    m3 = linquantmod(sample(C,csample,4000),4);
    
    % Sendegewinne
    g1 = 1; g2 = 1; g3 = 7;

    % orthogonale codes erzeugen
    w1 = [ +1 -1 +1 +1 +1 -1 -1 ]';
    w2 = [ +1 -1 -1 +1 -1 +1 +1 ]';
    w3 = [ -1 +1 +1 +1 -1 -1 +1 ]';
    
    % alle Nachrichten auf die Länge der längsten normieren
    maxsize =  max([ max(size(m1)) max(size(m2)) max(size(m3)) ]);
    m1(max(size(m1)):maxsize) = 0;
    m2(max(size(m2)):maxsize) = 0;
    m3(max(size(m3)):maxsize) = 0;
    
    % codieren
    C = g1*spread(m1,w1)+g2*spread(m2,w2)+g3*spread(m3,w3);
    
    % decodieren
    m1strich = despread(C,w1);
    m2strich = despread(C,w2);
    m3strich = despread(C,w3);
    
    % abspielen
    sound(relinquant(m3strich',4), 4000)

end