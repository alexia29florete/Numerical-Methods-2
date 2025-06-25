function filtered_signal = high_pass(signal, fs, cutoff_freq)
  %signal = 0;
  %the Fourier Transform of the signal
  computed_signal = fft(signal);

  %all possible frequencies of the signal
  signal_len = length(signal);
  delta_f = fs / signal_len;
  f = zeros(1, signal_len);
  for i = 1:signal_len
    f(i) = (i-1) * delta_f;
    if f(i) > fs / 2
      f(i) = f(i) - fs;
    endif
  endfor

  %a vector mask
  mask = zeros(1, signal_len);
  for i = 1:signal_len
    if abs(f(i)) > cutoff_freq
      mask(i) = 1;
    endif
  endfor
  mask = mask(:);

  %Apply the Hadamard product between the Fourier Transform of the signal and the mask
  signal_filt = computed_signal .* mask;

  %the inverse Fourier Transform to get the filtered signal
  filtered_signal = ifft(signal_filt);

  %Normalize the filtered signal
  filtered_signal = filtered_signal / max(abs(filtered_signal));

  %It returns the filtered signal as a column vector
  filtered_signal = filtered_signal(:);
end
