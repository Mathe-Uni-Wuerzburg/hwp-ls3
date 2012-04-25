function aufgabeA3(factor,low)
    
    [A,abtast,bit] = wavread('run');
    
    %A = [1 4 9 16 25 36]';
    B = lowpass(A,abtast,low);
    
    C = sample(B,abtast,floor(abtast*factor));
    wavwrite(C,'run2');
    sound(A,abtast,bit);
    sound(B,abtast,bit);
    sound(C,floor(abtast*factor),bit);
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

function T = lowpass(vector, abtast, grenz)
    
    T = fft(vector);

    [n,m] = size(T);
    for i = grenz:n
       T(i) = 0; 
    end
    
    T = real(ifft(T));
end