function [S f t] = spectrogram(signal, fs, window_size)
  %Initialize variables
  S = 0;
  f = 0;
  t = 0;

  n = length(signal);
  n_windows = floor(n / window_size);
  doubled = 2 * window_size;

  %initializez
  S = zeros(window_size, n_windows);
  t = zeros(n_windows, 1);
  f = zeros(window_size, 1);

  %https://www.mathworks.com/help/signal/ref/hann.html
  han_windows = hanning(window_size);

  for i = 1:n_windows
    start_window = (i - 1) * window_size + 1;
    end_window = start_window + window_size - 1;
    fereastra_segm = signal(start_window:end_window);

    windowed = fereastra_segm .* han_windows;

    %https://www.mathworks.com/help/matlab/ref/fft.html
    spectrum = fft(windowed, doubled);

    %pastrez doar jumatatea pozitiva
    S(:, i) = abs(spectrum(1:window_size));
  endfor

  delta_t = window_size / fs;
  delta_f = fs / doubled;
  for i = 1:n_windows
    t(i) = (i-1) * delta_t;
  endfor

  for i = 1:window_size
    f(i) = (i-1) * delta_f;
  endfor
end
