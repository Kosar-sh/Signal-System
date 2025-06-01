file_path = 'record_audio.wav';
output_file_path='x.wav';
[x, Freq] = audioread(file_path);
time=(0:length(x)-1)/Freq;
figure; 
plot(time,x);
xlabel("time")
ylabel("amplitude")
grid on
audiowrite(output_file_path, x,Freq);
