function aufgabeA5 ()
   
    [A,abtast,bit] = wavread('ring');
    A = lowpass(A,0,11000);
    A = sample(A,abtast,8000);
    sound(A,8000,bit);
    [n,m] = size(A);
    Asum = sum(A.*A);
    for i = 8:16
        B = linquant(A,i);
        Bsum = sum((B-A).*(B-A));
        sqnr(i-7) = 10*log10(((1/n) * Asum)/((1/n) * Bsum));
    end
    plot(8:16,sqnr,'o');
    xlabel('Quantisierung [bit]');
    ylabel('SQNR [dB]');
    
end