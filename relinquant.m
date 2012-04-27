function quant = relinquant(binaer, n)
  quant = message2int(binaer, n);
  quant = quant / (2^n);
end