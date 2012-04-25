function aufgabeA2(int)

    [T,abtast,bits] = wavread('aloha');
    sound(T,abtast,bits);
    T = lowpass(T,0,int);
    sound(T,abtast,bits);

end


function T = lowpass(vector, abtast, grenz)
    
    T = fft(vector);

    [n,m] = size(T);
    for i = grenz:n
       T(i) = 0; 
    end
    
    T = real(ifft(T));
end