function ece2312_project_1_main

% get input/output info 
audiodevinfo(1)
audiodevinfo(1,0)
audiodevinfo(0,1)
audiodevinfo(1,0,44100,24,1)

% Record and play audio
mic = audiorecorder(44100,24,1,0);
disp('Start speaking.');
recordblocking(mic, 5);
disp('End of recording. Playing back ...');
voice = audioplayer(mic,1);
playblocking(voice, 5);
recording = getaudiodata(mic);

%Time Plot
t = [0:length(recording)-1] / 44100;
subplot(2,1,1)
plot(t, recording) 
title('Amplitude vs Time'); 
ylabel('Amplitude'); 
xlabel('Time (Seconds)');

%Spectrogram-
window = hamming(512);
N.overlap = 256;
N.fft = 1024;
[S,F,T,P] = spectrogram(recording, window, N.overlap, N.fft, 44100, 'yaxis');
subplot(2,1,2)
surf(T,F,10*log10(P), 'EdgeColor','none');
axis tight;
view(0, 90);
colormap(jet);
set(gca, 'clim', [-80,-20]);
ylim([0 8000]);
xlabel('Time (s)'); ylabel('Frequency (Hz)');


% Write and read
audiowrite('crazyfredrick.wav', recording, 44100)

return

