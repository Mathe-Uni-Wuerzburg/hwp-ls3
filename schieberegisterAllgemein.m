function codewort=schieberegisterAllgemein(nutzbits,polynom,n)
  k = max(size(nutzbits));
  reg = zeros(1,n-k);
  for i=1:k
      alt = reg;
      h = xor(nutzbits(i),reg(n-k));
      reg(1) = h;
      for j=2:n-k
          if (polynom(j) == 0)
              reg(j) = alt(j-1);
          else
              reg(j) = xor(alt(j-1), h);
          end
      end
  end
  nutzbits(k+1:n) = reg;
  codewort = nutzbits;
end

function a = xor(b1,b2)
  a = mod(b1+b2,2);
end