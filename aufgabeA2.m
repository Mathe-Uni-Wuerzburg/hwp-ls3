function aufgabeA2(int)

    [T,abtast,bits] = wavread('run');
    sound(T,abtast,bits);
    T = lowpass(T,0,int);
    sound(T,abtast,bits);

end