function x = oscillator(freq, fs, dur, A, D, S, R)
  x = 0;
  t = 0:(1/fs):dur;
  t = t(1:end-1);
  sine_wave = sin(2*pi*freq*t);

  %the number of attack samples, decay samples, sustain samples and release samples
  total_num = length(t);
  attack_num = floor(fs * A);
  decay_num = floor(fs * D);
  release_num = floor(fs * R);
  sustain_num = max(0, total_num - attack_num - release_num - decay_num);

  %the attack envelope using a linear ramp from 0 to 1 over the attack samples
  attack_env = (0:(attack_num - 1)) / (attack_num - 1);

  %the decay envelope using a linear ramp from 1 to the sustain level
  decay_env = 1 - ((0:(decay_num - 1)) / (decay_num - 1)) * (1 - S);

  %the sustain envelope using a constant value equal to the sustain level
  sustain_env = S * ones(sustain_num, 1);

  %the release envelope using a linear ramp from the sustain level to 0 over the release samples
  release_env = S * (1 - (0:(release_num - 1)) / (release_num - 1));

  envelope = [attack_env, decay_env, sustain_env', release_env];
  envelope_len = length(envelope);

  if envelope_len < total_num
    envelope(end+1:total_num) = 0;
  elseif envelope_len > total_num
    envelope = envelope(1:total_num);
  endif

  x = sine_wave .* envelope;
  x = x(:);
end
