function A = aufgabeA4(quant)
    
    [A,abtast,bit] = wavread('run');
    %clf;
    %plot(A,'r-');
    %hold on;
    A = linquantmod(A,quant);
    %A = linquant(A,quant);
    %sound(A,abtast,bit);
    %plot(A,'g-');

end

