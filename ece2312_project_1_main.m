function ece2312_project_1_main

recordLength = 5;
audiodevinfo(1,0);
audiodevinfo(1,0,44100,24,1);
audiodevinfo(0,2);

recorder = audiorecorder(44100,24,1,0);
disp('Start')
recordblocking(recorder,recordLength);
disp('Finished')

player = audioplayer(recorder,2);
playblocking(player,recordLength);

recording = getaudiodata(recorder);

makeSpectrogram(recording);

% window = hamming(512);
% N_overlap = 256;
% N_fft = 1024;
% [S,F,P,T] = spectrogram(recording,window,N_overlap,N_fft,44100,'yaxis');
% figure;
% surf(T,F,10*log10(P),'EdgeColor','none');
% axis tight;
% view(0,90);
% colormap(jet);
% set(gca,'clim',[-80,-20]);
% ylim([0 8000]);
% xlabel('Time (s)');ylabel('Frequency (Hz)');

return