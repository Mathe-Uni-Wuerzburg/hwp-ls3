function r = divrest(divident, divisor)

    n = max(size(divident));
    m = max(size(divisor));
    if (n < m)
        divident(n+1:m) = 0;
    elseif (m < n)
        divisor(m+1:n) = 0;
    end

    divident;
    divisor;
    
    a = hoechsteEins(divident);
    b = hoechsteEins(divisor);

    while(a >= b)
       
        divident = mod(divident - linksshift(divisor,a-b+1),2);
        a = hoechsteEins(divident);
        
    end

    r = divident;
    
end

function r = hoechsteEins(c)
    r = 0;
    for i=max(size(c)):-1:1
        if (c(i) == 1)
            r = i;
            break;
        end
    end 
end

function d = linksshift(c,n)
    d = zeros(1,max(size(c)));
    for i=n:max(size(d))
        d(i) = c(i-n+1);
    end
end