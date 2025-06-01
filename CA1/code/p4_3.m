function  p4_3(audio_name,speed)
[x, Freq] = audioread(audio_name);
len=length(x);
if speed==2
    output_audio=[];
    output_audio=x(1:2:end);
    sound(output_audio,Freq);
elseif speed==0.5
    audio_out=zeros(2*len-1,1);
    audio_out(1:2:end)=x;
    for i=1:len-1
        audio_out(2*i)=mean(x(i:i+1));
    end
    sound(audio_out,Freq);
else 
    fprintf('The speed is not valid');
end
end

