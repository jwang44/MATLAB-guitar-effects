function [out]=gtrdist(in,gain,level,tone,fs)
%4 parameters in total£¬with fs retrieved directly from the audio
%GAIN ranges between 0-11

b=in;
b=b/max(abs(b)); %normalization
b=gain*b;

i=(b>=0.75); b(i)=1;  
i=(b<=-2/3); b(i)=-1;

c1=4*sqrt(2); c2=3*sqrt(2);
i=(b>=0.5 & b<=0.75);
b(i)=(4-(c2-c1*b(i)).^2)./4;

c2=4-sqrt(6); c1=6-3*sqrt(6);
i=(b<=-1/3 & b>=-2/3);
b(i)=(3-(c2+c1*b(i)).^2)./3;

%get the parameters for the digital filter [B,A] = BUTTER(N,Wn,'low/high') 
[ZL,PL,KL]=butter(1,1200/(fs/2),'low');
[ZH,PH,KH]=butter(1,265/(fs/2),'high');

[BL,AL]=zp2tf(ZL,PL,KL);
[BH,AH]=zp2tf(ZH,PH,KH);

%filter
out=((1-tone)*filter(BL,AL,b)+tone*filter(BH,AH,b));
out=out*max(abs(in))/max(abs(out))*level/5;
end