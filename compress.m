function [out]=compress(in,slope,thr)
in1=in/max(abs(in));%normalization, so that the same threshold value can be set, no matter the original velocity
out=in1;
pos=(in1>thr);
neg=(in1<-thr);
out(pos)=slope*(in1(pos)-thr)+thr;
out(neg)=slope*(in1(neg)+thr)-thr;
out=out*max(abs(in));
end