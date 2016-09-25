
import daq.*;

x = wgn(50000,1,1);
fc = 300;
fs = 1000;

[b,a] = butter(6,fc/(fs/2));


dataIn = randn(100,1);
dataOut = filter(b,a,dataIn);

%DEVICE SET UP
d = daq.getDevices
s1 = daq.createSession('directsound')
s2 = daq.createSession('directsound')
s3 = daq.createSession('directsound')
s4 = daq.createSession('directsound')
s5 = daq.createSession('directsound')
s6 = daq.createSession('directsound')
s7 = daq.createSession('directsound')
s8 = daq.createSession('directsound')
addAudioOutputChannel(s1, 'Audio7', 1:8);
addAudioOutputChannel(s2, 'Audio7', 1:8);
addAudioOutputChannel(s3, 'Audio7', 1:8);
addAudioOutputChannel(s4, 'Audio7', 1:8);
addAudioOutputChannel(s5, 'Audio7', 1:8);
addAudioOutputChannel(s6, 'Audio7', 1:8);
addAudioOutputChannel(s7, 'Audio7', 1:8);
addAudioOutputChannel(s8, 'Audio7', 1:8);
fs = s1.Rate

%SOUND GENERATOR

x = wgn(100000,1,1);
bp1 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,350,450,fs));
bp2 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,350,450,fs));
bp3 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,500,600,fs));
bp4 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,650,750,fs));
bp5 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,800,900,fs));
bp6 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,950,1050,fs));
bp7 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,1100,1200,fs));
bp8 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,1250,1350,fs));
null = design(fdesign.bandpass('N,F3dB1,F3dB2',10,10,20,fs));
filterL = [bp1, bp2, bp3, bp4, bp5, bp6, bp7, bp8]
% 
% num =randperm(8)
% numSounds = num(1)
% 
% numChannels = num(1)
% Channels = num(1:numChannels)
% 
% 
% B =filterL(randperm(length(filterL)))
% A = B(1:numSounds)

%CHANNEL GENERATOR

segmentEnd = [100000];
nspeakers = 8;
nspeakergroups1 = 1;
speakerselection1 = cell(1, nspeakergroups1);
nspeakergroups2 = 1;
speakerselection2 = cell(1,nspeakergroups2)
nspeakergroups3 = 1;
speakerselection3 = cell(1,nspeakergroups3)
nspeakergroups4 = 1;
speakerselection4 = cell(1,nspeakergroups4)
nspeakergroups5 = 1;
speakerselection5 = cell(1,nspeakergroups5)
nspeakergroups6 = 1;
speakerselection6 = cell(1,nspeakergroups6)
nspeakergroups7 = 1;
speakerselection7 = cell(1,nspeakergroups7)
nspeakergroups8 = 1;
speakerselection8 = cell(1,nspeakergroups8)
    
for B = [bp1]
    y1 =  bandpass_butterworth(x,[200 300],fs,1);
    y2 =  bandpass_butterworth(x,[900 1000],fs,1);
    y3 =  bandpass_butterworth(x,[1000 1100],fs,1);
    y4 =  bandpass_butterworth(x,[1100 1200],fs,1);
    y5 =  bandpass_butterworth(x,[1300 1400],fs,1);
    y6 =  bandpass_butterworth(x,[1500 1600],fs,1);
    y7 =  bandpass_butterworth(x,[1600 1700],fs,1);
    y8 =  bandpass_butterworth(x,[1700 1800],fs,1);
    
%     y1 = filter(bp1,x)
%     y2 = filter(bp2,x)
%     y3 = filter(bp3,x)
%     y4 = filter(bp4,x)
%     y5 = filter(bp5,x)
%     y6 = filter(bp6,x)
%     y7 = filter(bp7,x)
%     y8 = filter(bp8,x)
    speakerselection1{1} = [1];
    time = hat;
    speakerselection2{1} = [1];
    time = hat;
    speakerselection3{1} = [1];
    time = hat;
    speakerselection4{1} = [1];
    time = hat;
    speakerselection5{1} = [1];
    time = hat;
    speakerselection6{1} = [1];
    time = hat;
    speakerselection7{1} = [1];
    time = hat;
    speakerselection8{1} = [1];
    time = hat;
    

    [singleChannelOutput1] = ...
        helper_surround_sound_single_voices(y1, segmentEnd, nspeakers, nspeakergroups1, speakerselection1);
     queueOutputData(s1, singleChannelOutput1);
     
    [singleChannelOutput2] = ...
        helper_surround_sound_single_voices(y2, segmentEnd, nspeakers, nspeakergroups2, speakerselection2);
    queueOutputData(s2, singleChannelOutput2);

    
    [singleChannelOutput3] = ...
        helper_surround_sound_single_voices(y3, segmentEnd, nspeakers, nspeakergroups3, speakerselection3);
     queueOutputData(s3, singleChannelOutput3);

     
    [singleChannelOutput4] = ...
        helper_surround_sound_single_voices(y4, segmentEnd, nspeakers, nspeakergroups4, speakerselection4);
    queueOutputData(s4, singleChannelOutput4);
% 
    
    [singleChannelOutput5] = ...
        helper_surround_sound_single_voices(y5, segmentEnd, nspeakers, nspeakergroups5, speakerselection5);
     queueOutputData(s5, singleChannelOutput5);

     
    [singleChannelOutput6] = ...
        helper_surround_sound_single_voices(y6, segmentEnd, nspeakers, nspeakergroups6, speakerselection6);
    queueOutputData(s6, singleChannelOutput6);

    
        [singleChannelOutput7] = ...
        helper_surround_sound_single_voices(y7, segmentEnd, nspeakers, nspeakergroups7, speakerselection7);
     queueOutputData(s7, singleChannelOutput7);

     
    [singleChannelOutput8] = ...
        helper_surround_sound_single_voices(y8, segmentEnd, nspeakers, nspeakergroups8, speakerselection8);
    queueOutputData(s8, singleChannelOutput8);
%     
    'DONE'
    startBackground(s1);
    startBackground(s2);
    startBackground(s3);
    startBackground(s4);
    startBackground(s5);
    startBackground(s6);
    startBackground(s7);
    startBackground(s8);
%     
end





