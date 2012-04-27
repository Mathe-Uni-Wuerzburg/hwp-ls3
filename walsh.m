function Hn = walsh(n)
    if (n == 1)
        Hn = [ -1 ];
    else
        Hnhalbe = walsh(n/2);
        Hn = [Hnhalbe Hnhalbe ; Hnhalbe Hnhalbe*(-1) ];
    end
end