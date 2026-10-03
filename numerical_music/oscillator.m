function x = oscillator(freq, fs, dur, A, D, S, R)

  %crearea vectorului time
  time = ( 0 : 1/fs:  dur -1/fs ) ;
  time = time' ;

  %cream sine wave
  sin_wave = sin(2*pi*freq*time);

  %cream samples
  attack = floor(A* fs);
  decay = floor(D* fs);
  release = floor(R* fs);
  total = length(time);
  sustain = total - attack - decay-release;
  if sustain <0
    sustain = 0;
  endif

  %cream envelope-uri pt fiecare faza
  a_env = linspace(0, 1, attack );
  a_env = a_env' ;
  d_env = linspace( 1, S, decay);
  d_env = d_env' ;
  s_env = S* ones( sustain, 1);
  r_env = linspace(S , 0, release);
  r_env = r_env' ;

  %conectam fazele
  t_env= [a_env; d_env; s_env; r_env ] ;
  t_env = t_env (1: total);
  x= sin_wave .*t_env;

end
