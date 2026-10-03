function mono = stereo_to_mono(stereo)
  mono = stereo;

  % Normalize
  % am transformat semnali stereo in mono folosind instructia mean
  mono = mean( stereo, 2);
  mono = mono / max(abs(mono));
end
