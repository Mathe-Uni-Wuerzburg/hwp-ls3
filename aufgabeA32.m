function aufgabeA32
    A = zeros(16,4);
    for i=2:16
        A(i,:) = binaryAddOne(A(i-1,:));
    end
    
    for i=1:16
       ham = 0;
       alg = 0;
       
       c = revese(A(i,:));
       
       tic;
       x = schieberegisterHamming(c);
       ham = toc;
       
       tic;
       y = schieberegisterAllgemein(c,[1 1 0 1],7);
       alg = toc;
       
       if (x ~= y)
           error('bla');
       end
       
       fprintf('Hamming %d, Allgemein %d, Differenz %d\n', ham, alg, ham-alg);
    end
end

function d = revese(c)
    d = zeros(1,max(size(c)));
    for i=1:max(size(c))
       d(max(size(c))-i+1) = c(i); 
    end
end