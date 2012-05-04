function aufgabeA3(factor,low)
    
    [A,abtast,bit] = wavread('run');
    
    B = lowpass(A,abtast,low);
    
    C = sample(B,abtast,floor(abtast*factor));
    wavwrite(C,'run2');
    sound(A,abtast,bit);
    sound(B,abtast,bit);
    sound(C,floor(abtast*factor),bit);
end