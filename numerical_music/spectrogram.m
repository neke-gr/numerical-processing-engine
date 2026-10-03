function [S f t] = spectrogram(signal, fs, window_size)
	S = 0;
  f = 0;
  t = 0;

    %verificam ca signal este un vector coloni
    signal = signal(:);
    n = length(signal);
    %size pt fiecare fft
    m = window_size;

    %folosind instructia floor calculam  nr total de window
    window = floor( n /m );

    %cream matricea
    S = zeros( m, window);

    %folosind hanning cream un window noua
    window_nou = hanning(m);

    % instructie while pt fiecare window segment

    i = 1
    while i<= window

      start = (i-1)* m +1 ;
      the_end= start + window_size -1;
      window_s = signal ( start : the_end).* window_nou;
      result = fft(window_s, 2* m);
      S(:, i) = abs(result(1: m));
      i = i+ 1;
    endwhile

    % frecventa
    f = (0: m-1)' *fs /(2*m) ;
    % vect de timp
    t=((0: window -1)' * m) /fs;

end
