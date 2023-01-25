function ece2312_project_1_main

recordLength = 5;
micname = audiodevinfo(1,0)
audiodevinfo(1,0,44100,24,1)
audiodevinfo(0,2)

recorder = audiorecorder(44100,24,1,0)
disp('Start')
recordblocking(recorder,recordLength)
disp('Finished')

player = audioplayer(recorder,2)
playblocking(player,recordLength)

return