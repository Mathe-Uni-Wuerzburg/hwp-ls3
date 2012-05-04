function quantSignal = linquant (signal, quantLaenge)
    n = 2^quantLaenge;
	quantSignal = round(((signal+1)/2)*(n-1))*2/(n-1)-1;
end
	
