
recordLength = 5; %set the length of the recording in seconds
audiodevinfo(1,0); %verify microphone
audiodevinfo(1,0,44100,24,1); %check sample frequency, bit storage, and chanels
audiodevinfo(0,2); %verify speaker

%% comment the lines below for audio file playback
recorder = audiorecorder(44100,24,1,0); %create audio recording object, 44100Hz, 24bit, mono or stereo, 0(default microphone)
disp('Start recording')
recordblocking(recorder,recordLength); %record for recordLength seconds
disp('Recording finished')

%% comment through line 18 for recording playback
% [audioFile,Fs] = audioread('ivorybuckles.wav'); %read audio file
% %the next 2 lines convert the audio to one sided stereo, comment calls for makeSpectrogram
% %emptyChannel = zeros([220500,1]); 
% %audioFile = cat(2,audioFile,emptyChannel);
% player = audioplayer(audioFile,Fs,24,2); %create playback object from a previously recorded file

%% comment the line below for audio file playback
player = audioplayer(recorder,2); %create playback object from recording object

%% always needed
disp('Playing back')
playblocking(player,recordLength); %playback recorded sample
disp('Done')

%% comment these lines for audio file playback
recording = getaudiodata(recorder); %convert recorder object into an audio file
audiowrite('recording1.wav',recording,44100);

%% pick the graph for the desired output, do not use during stereo
makeSpectrogram(recording); %graph recorded audio as a spectrogram
%makeSpectrogram(audioFile); %graph audio file as a spectrogram

%%

function makeSpectrogram(audio_data)

% A function to create a spectrogram of an audio recording (with time plot)

t = [0:length(audio_data)-1] / 44100;
subplot(2,1,1)
plot(t, audio_data) 
title('Amplitude vs Time'); 
ylabel('Amplitude'); 
xlabel('Time (Seconds)');

window = hamming(512);
N_overlap = 256;
N_fft = 1024;
[~,F,T,P] = spectrogram(audio_data,window,N_overlap,N_fft,44100,'yaxis');
subplot(2,1,2)
surf(T,F,10*log10(P),'edgecolor','none');
axis tight;
view(0,90);
colormap(jet);
set(gca,'clim',[-80,-20]);
ylim([0 8000]);
title('Spectrogram');xlabel('Time (s)');ylabel('Frequency (Hz)');

end
