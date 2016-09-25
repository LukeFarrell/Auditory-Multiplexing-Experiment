import daq.*;

% filenameL = 'C:\Users\Luke\Desktop\NoiseL.wav';
% filenameR = 'C:\Users\Luke\Desktop\NoiseR.wav'

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

% samples = [1,3*fs];
% [yL,fs] = audioread(filenameL,samples);
% [yR,fs] = audioread(filenameR,samples);

%FILTER GENERATOR

x = wgn(100000,1,1);
bp1 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,200,300,fs));
bp2 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,350,450,fs));
bp3 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,500,600,fs));
bp4 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,650,750,fs));
bp5 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,800,900,fs));
bp6 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,950,1050,fs));
bp7 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,1100,1200,fs));
bp8 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,1250,1350,fs));
null = design(fdesign.bandpass('N,F3dB1,F3dB2',10,10,20,fs));
filterL = [bp1, bp2, bp3, bp4, bp5, bp6, bp7, bp8]

%Randomize Number of Sounds

num1 =randperm(8)
numSounds = num1(1)
Sounds = num1(1:numSounds) 

%Randomize Number of Channels
num2 = randperm(numSounds)
numChannels = num2(1)
Channels = num2(1:numChannels)

%Assign Speaker Groups
Sounds_per_Channel = floor(numSounds/numChannels)
Remainder =rem(numSounds,numChannels)

for X = 1:numChannels;
    if X == 1 & Remainder == 0;
        SoundGroup = Sounds(1:Sounds_per_Channel)
        RemainderGroup = Sounds(numSounds-Remainder+1:numSounds)
        SoundGroup1 = union(SoundGroup,RemainderGroup)
    end
    if X == 2;
        SoundGroup2 = Sounds((Sounds_per_Channel*(X-1))+1:Sounds_per_Channel*X)
    end
    if X == 3;
        SoundGroup3 = Sounds((Sounds_per_Channel*(X-1))+1:Sounds_per_Channel*X)
    end
    if X == 4;
        SoundGroup4 = Sounds((Sounds_per_Channel*(X-1))+1:Sounds_per_Channel*X)
    end
    if X == 5;
        SoundGroup5 = Sounds((Sounds_per_Channel*(X-1))+1:Sounds_per_Channel*X)
    end
    if X == 6;
        SoundGroup6 = Sounds((Sounds_per_Channel*(X-1))+1:Sounds_per_Channel*X)
    end
    if X == 7;
        SoundGroup7 = Sounds((Sounds_per_Channel*(X-1))+1:Sounds_per_Channel*X)
    end
    if X == 8;
        SoundGroup8 = Sounds((Sounds_per_Channel*(X-1))+1:Sounds_per_Channel*X)
    end
end

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


Sounds
Channels
SoundGroup1
numChannels 

% y1 = filter(bp1,x)
% y2 = filter(bp8,x)
% y3 = filter(bp3,x)
% y4 = filter(bp7,x)
% y5 = filter(bp5,x)
% y6 = filter(bp6,x)
% y7 = filter(bp7,x)
% y8 = filter(bp2,x)
% % 
% % 
% speakerselection3{1} = Channels[1];
% speakerselection1{1} = [1];
% speakerselection2{1} = [2];
% speakerselection3{1} = [3];
% speakerselection4{1} = [4];
% speakerselection5{1} = [5];
% speakerselection6{1} = [6];
% speakerselection7{1} = [7];
% speakerselection8{1} = [8];
% % 
% % 
%     [singleChannelOutput1] = ...
%         helper_surround_sound_single_voices(y1, segmentEnd, nspeakers, nspeakergroups1, speakerselection1);
%     queueOutputData(s1, singleChannelOutput1);
% 
% 
%     [singleChannelOutput2] = ...
%         helper_surround_sound_single_voices(y2, segmentEnd, nspeakers, nspeakergroups2, speakerselection2);
%     queueOutputData(s2, singleChannelOutput2);
% 
%     
%     [singleChannelOutput3] = ...
%         helper_surround_sound_single_voices(y3, segmentEnd, nspeakers, nspeakergroups3, speakerselection3);
%      queueOutputData(s3, singleChannelOutput3);
% % 
%      
%     [singleChannelOutput4] = ...
%         helper_surround_sound_single_voices(y4, segmentEnd, nspeakers, nspeakergroups4, speakerselection4);
%     queueOutputData(s4, singleChannelOutput4);
% % % 
%     
%     [singleChannelOutput5] = ...
%         helper_surround_sound_single_voices(y5, segmentEnd, nspeakers, nspeakergroups5, speakerselection5);
%      queueOutputData(s5, singleChannelOutput5);
% % 
%      
%     [singleChannelOutput6] = ...
%         helper_surround_sound_single_voices(y6, segmentEnd, nspeakers, nspeakergroups6, speakerselection6);
%     queueOutputData(s6, singleChannelOutput6);
% % 
%     
%         [singleChannelOutput7] = ...
%         helper_surround_sound_single_voices(y7, segmentEnd, nspeakers, nspeakergroups7, speakerselection7);
%      queueOutputData(s7, singleChannelOutput7);
% 
%      
%     [singleChannelOutput8] = ...
%         helper_surround_sound_single_voices(y8, segmentEnd, nspeakers, nspeakergroups8, speakerselection8);
%     queueOutputData(s8, singleChannelOutput8);
% %     
%     'PLAYING'
%     startBackground(s1);
%     startBackground(s2);
%     startBackground(s3);
%     startBackground(s4);
%     startBackground(s5);
%     startBackground(s6);
%     startBackground(s7);
%     startForeground(s8);
%     'DONE'
% % % %     
% end
% 
% % %CALCULATE PERCENT CORRECT
% % correct = [];
% % if numChannels == keypress:
% %     Pcorrect = 1
% % else
% %     Pcorrect = 0
% % end
% % 
% % Percent = mean(correct)
% 
