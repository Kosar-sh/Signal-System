function p4_4(audio_name, speed)
    [x, Freq] = audioread(audio_name);
    len = length(x);
    if speed == 2
        output_audio = x(1:2:end);
        sound(output_audio, Freq);
    elseif speed == 0.5
        audio_out = zeros(2 * len - 1, 1);
        audio_out(1:2:end) = x;
        for i = 1:len-1
            audio_out(2*i) = mean(x(i:i+1));
        end
        sound(audio_out, Freq);
    elseif speed > 0.5 &&  speed < 2 
        first_index=1:len;
        new_index=linspace(1,len,round(len /speed));
        audio_out=interp1(first_index,x,new_index,"linear");
        sound(audio_out, Freq);
    else 
        fprintf('The speed is not valid\n');
    end
end