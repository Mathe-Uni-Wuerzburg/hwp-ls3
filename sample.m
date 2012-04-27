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