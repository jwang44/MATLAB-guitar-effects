function [ out ] = tremolo(in,fs,rate,depth,LFO)
n = (1:length(in))';
arg= 2*pi*rate/fs * n;
if LFO=='01' %LFO shape
        a = depth*square(arg); 
    else
        if LFO=='02'
            a = depth*sawtooth(arg,0.5);
        else
            a = depth*sin(arg);
        end
end
out = in.*(1+a);
end