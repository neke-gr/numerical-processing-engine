function signal = apply_reverb(signal, impulse_response)

  %facem impulse_response mono
 impulse_response = stereo_to_mono(impulse_response);

 % cream convolutia
 signal = fftconv(signal, impulse_response);

 %normalizam
  signal = signal /max(abs(signal)) ;

end
