function signal = apply_reverb(signal, impulse_response)

  %the impulse response is in mono by using stereo_to_mono
  impulse_mono = stereo_to_mono(impulse_response);

  %the convolution between the signal and the impulse response
  signal = fftconv(signal, impulse_mono);
  %Normalize the resulting signal
  signal = signal / max(abs(signal));
end
