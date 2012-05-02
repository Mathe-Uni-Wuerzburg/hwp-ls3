% polynom muss länge n haben!
function codewort = polydiv(nutzbits,polynom,n)
    c = zeros(1,n);
    c(n-max(size(nutzbits))+1:n) = nutzbits;
    c
    pruefbits = divrest(c, polynom)
    codewort = pruefbits + c;
end

