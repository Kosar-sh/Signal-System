file_path = 'record_audio.wav';
[x, Freq] = audioread(file_path);
fprintf('the frequency is equal to : %d\n', Freq);