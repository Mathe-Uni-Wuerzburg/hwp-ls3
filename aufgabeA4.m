function aufgabeA4(quant)
    
    [A,abtast,bit] = wavread('aloha');
    clf;
    plot(A,'r-');
    hold on;
    A = linquant(A,quant);
    sound(A,abtast,bit);
    plot(A,'g-');

end

function signal = linquant(signal, quantlaeng)
    
    [n,m] = size(signal);
    q = 2^(quantlaeng-1);

    for i = 1:n
        signal(i) = floor(signal(i)*q)/q;
    end
end

