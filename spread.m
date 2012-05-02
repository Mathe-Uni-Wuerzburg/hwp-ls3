function z = spread(use,spreadCode)

    [n,m] = size(use);
    [a,b] = size(spreadCode);
    z = 1:(n*a);
    for i = 1:n
        j = ((i-1)*a+1);
        k = ((i*a));
        z(1, j:k) = use(i)*spreadCode';
    end
    
    z = z'; 
    
end