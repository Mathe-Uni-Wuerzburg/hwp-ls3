function result=meggitDecodierer(rcvdSequence,polynom)
    syndrom = divrest(rcvdSequence,polynom);
    n = max(size(syndrom));
    j = -1;
    if (sum(syndrom) == 1)
        for i=1:n
            if (syndrom(i) == 1)
                j = i;
                break;
            end
        end
    elseif (sum(syndrom) > 1)
        error('nicht korrigierbarer fehler');
    end
    result.syndrom = syndrom;
    result.errorInBit = j;
end
