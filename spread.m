function z = spread(use,spreadCode)

    % Vektoren normalisieren
    [n,m] = size(use);
    if (m > n)
        use = use';
        n = m;
    end
    
    [a,b] = size(spreadCode);
    if (b > a)
        spreadCode = spreadCode';
        a = b;
    end
    
    z = 1:(n*a);
    for i = 1:n
        j = ((i-1)*a+1);
        k = ((i*a));
        z(1, j:k) = use(i)*spreadCode';
    end
    
    z = z'; 
    
end