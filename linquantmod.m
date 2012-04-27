function quantSignal = linquantmod (signal, quantLaenge)
	
	% Anzahl der Stufen bestimmen
	anzahlStufen = 2^quantLaenge;
	stufenHoehe = 2/anzahlStufen ;
	halbeStufenHoehe = stufenHoehe/2;
	faktor = 1 + floor(halbeStufenHoehe);
	signal = signal * faktor;
	% Signal-Werte auf die Stufen runden
    signal = abs((round(signal .* (anzahlStufen - 1)))/faktor);
	quantSignal = int2message(signal, quantLaenge);
end
	
