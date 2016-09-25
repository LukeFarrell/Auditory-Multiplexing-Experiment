%IMPORT DEVICE
import daq.*;

%DEVICE SET UP
d = daq.getDevices
s = daq.createSession('directsound')
addAudioOutputChannel(s, 'Audio7', 1:8);
fs = s.Rate
lowerR = 800;
upperR = 1600;

x = wgn(50000,1,1);
fc = 300;
fs = 1000;

[b,a] = butter(6,fc/(fs/2));
freqz(b,a)

dataIn = randn(1000,1);
dataOut = filter(b,a,x);

% GENERATE SOUND
bp1 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,200,300,fs));
bp2 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,350,450,fs));
bp3 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,500,600,fs));
bp4 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,650,750,fs));
bp5 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,800,900,fs));
bp6 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,950,1050,fs));
bp7 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,1100,1200,fs));
bp8 = design(fdesign.bandpass('N,F3dB1,F3dB2',10,1250,1350,fs));
filterL = [bp1, bp2, bp3, bp4, bp5, bp6, bp7, bp8]


segmentEnd = [50000];
nspeakers = 8;
nspeakergroups = 1;
speakerselection = cell(1, nspeakergroups);

speakerselection{1} = [1];
speakerselection{2} = [2];
speakerselection{3} = [3];
speakerselection{4} = [4];
speakerselection{5} = [5];
speakerselection{6} = [6];
speakerselection{7} = [7];
speakerselection{8} = [8];

% num =randperm(8)
% numSounds = num(1)
numSounds = 8
% 
% numChannels = num(1)
% 
% B =filterL(randperm(length(filterL)))

%GENERATE CHANNELS

for A = filterL(1:numSounds)
    y = (filter(A,x))
    
    
    [singleChannelOutput] = ...
        helper_surround_sound_single_voices(y, segmentEnd, nspeakers, nspeakergroups, speakerselection);
    queueOutputData(s, singleChannelOutput);
    
    startForeground(s);

end




