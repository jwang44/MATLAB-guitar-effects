clc;
clear;
close all;

audio_num=input('choose one original audio to process(01, 02 or 03):');
    if audio_num==1
        [A,fs]=audioread('clean_gtp.wav');
    elseif audio_num==2
            [A,fs]=audioread('chords_gtp.wav');
    elseif audio_num==3
            [A,fs]=audioread('sweet_child_gtp.wav');
    end
fprintf('some parameters:\n')
gain=input('gain(1��11):');
level=input('level(1��11):');
tone=input('tone(0 for muddiest sound��1 for brightest sound):');
B=A(:,1); 
C=gtrdist(B,gain,level,tone,fs);
n=length(B);
t=n/fs;
sound(B,fs);fprintf('original sample playing...\n');
pause(t+2);
subplot(2,1,1);plot(B);title('original signal waveform');
subplot(2,1,2);plot(C);title('processed signal waveform');
sound(C,fs);fprintf('processed sample playing...\n');