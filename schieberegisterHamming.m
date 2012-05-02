function codewort=schieberegisterHamming(nutzbits)
  reg = zeros(1,3);
  n = 7;
  k = max(size(nutzbits));
  for i=1:k
     alt = reg;
     reg(3) = alt(2);
     reg(2) = xor(alt(1),alt(3));
     reg(1) = xor(alt(3),nutzbits(i)); 
  end
  for i=1:n-k
     alt = reg;
     reg(3) = alt(2);
     reg(2) = xor(alt(1),alt(3));
     reg(1) = xor(alt(3),0);       
  end
  nutzbits(5:7) = reg;
  codewort = nutzbits;
end

function a = xor(b1,b2)
  a = mod(b1+b2,2);
end

