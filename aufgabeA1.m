function aufgabeA1 () 

    %
    % Fabian Helmschrott,
    % Nils Wisiol,
    % Andre Löffler
    %
    
    A = wavread('run');
    plotit(A,1);
    A = wavread('aloha');
    plotit(A,3);
    A = wavread('ring');
    plotit(A,5);
end

function plotit(A,i)

    [n,m] = size(A);

    subplot(3,2,i);
    plot(1:n, A);

    xlabel('Zeit in Abtastproben');
    ylabel('Amplitude (normiert)');

    i = i + 1;
    
    B = real(fftshift(fft(A)));
    [n,m] = size(B);

    subplot(3,2,i);
    plot((-n/2):(+n/2-1), B);

    xlabel('Frequenz [Hz]');
    ylabel('Häufigkeit');
end