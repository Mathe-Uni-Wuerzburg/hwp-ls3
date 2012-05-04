function x = despread(signal,spread)
    
    [n,m] = size(signal);
    if (m > n)
        signal = signal';
        n = m;
    end
    
    [a,b] = size(spread);
    if (b > a)
        spread = spread';
        a = b;
    end
    
    for i = 1:a:n
        x((i-1)/a +1) = sign(sum(signal(i:i+a-1) .* spread));
    end
    
    x = x';
end