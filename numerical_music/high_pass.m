function signal = high_pass(signal, fs, cutoff_freq)
  %trans fourier
  x = fft(signal);
  n = length(signal);

  %cream toate frecventile possibile
  frecventa = (0: n -1) * (fs / n);

  %cream vectorul mask
  vector_mask = ones(n, 1);

  i = 1;
  while i<= n
    frecv = frecventa(i);
     if (frecv >fs  -cutoff_freq) || frecv < cutoff_freq
        vector_mask(i) = 0;
     endif
     i = i+1;
  endwhile

  %produsul hadamard
  hadamard = x .* vector_mask;

  % folosinf ifft facem trans fourier inversa pentru hadamard
  inv_f = ifft(hadamard);

  %normalizam signal
  signal = real(inv_f);
  signal = signal /max(abs(signal)) ;
end

