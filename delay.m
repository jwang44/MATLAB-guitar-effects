function [ out ] = delay(in,fs,mix,delay_time,a)
delay_time=delay_time*fs;
in1=[in;zeros(delay_time*a,1)];
out=in1;
for i=1:a
    delayed=[zeros(delay_time*i,1);in;zeros(delay_time*(a-i),1)];
    out=out+ delayed.*(mix-0.1*i);
end

end