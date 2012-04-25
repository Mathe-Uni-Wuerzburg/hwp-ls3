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
        sqnr(i) = 10*log10(((1/n) * Asum)/((1/n) * Bsum));
    end
    plot(1:16,sqnr,'x');
    
end


function T = lowpass(vector, abtast, grenz)
    
    T = fft(vector);

    [n,m] = size(T);
    for i = grenz:n
       T(i) = 0; 
    end
    
    T = real(ifft(T));
end

function B = sample(A,abtast,abtastneu)

    [n,m] = size(A);
    
    step = floor(n/abtast*abtastneu);
    
    lin = linspace(1,n,step);
    B = zeros(1,step);
    
    for i = 1:step
       % wenn lin(i) ist, übernehmen wir den wert aus A
       if mod(lin(i),1) == 0
           B(i) = A(lin(i));
       % andernfalls interpolieren wir
       else
           % interpoliere Wert zwischen A(floor(lin(i))) und Nachfolger an
           % der entsprechenden Stelle zwischen 1 und 2
           B(i) = interp1([A(floor(lin(i))) A(floor(lin(i))+1)], lin(i)-floor(lin(i))+1);
       end
    end
end

function signal = linquant(signal, quantlaeng)
    
    [n,m] = size(signal);
    q = 2^(quantlaeng-1);

    for i = 1:n
        signal(i) = floor(signal(i)*q)/q;
    end
end

