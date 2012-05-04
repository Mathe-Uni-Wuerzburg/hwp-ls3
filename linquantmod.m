function quantSignal = linquantmod (signal, quantLaenge)
    n = 2^quantLaenge;
	quantSignal = int2message(round(((signal+1)/2)*(n-1)), quantLaenge);
end
	
