function x = despread(signal,spread)
    
    [n,m] = size(signal);
    [a,b] = size(spread);
    
    for i = 1:a:n
        x((i-1)/a +1) = sum(signal(i:i+a-1) .* spread)/a;
    end
    
    x = x';
end