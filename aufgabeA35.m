function aufgabeA35
    A = getBits();
    c = schieberegisterHamming(A);
    playWav(simError(c, 0.01, 1));
    playWav(simError(c, 0.01, 2));
    playWav(simError(c, 0.001, 1));
    playWav(simError(c, 0.001, 2));    
end