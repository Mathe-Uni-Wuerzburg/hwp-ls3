function T = lowpass(vector, abtast, grenz)
    
    T = fft(vector);

    [n,m] = size(T);
    for i = grenz:n
       T(i) = 0; 
    end
    
    T = real(ifft(T));
end