
%IMPORT DEVICE ACQUISITION LIBRARY
import daq.*;

%SET UP DATA INPUT BOX
prompt = {'Number of Trials:', 'Minimum Freq (Hz):', 'Enter Initials of Subject:' };
dlg_title = 'Input';
num_lines = 1;
defaultans = {'10','800','LMF'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
numtrials = str2double(cell2mat(answer(1)));
minFreq = str2double(cell2mat(answer(2)));
csvFile = cell2mat(answer(3));

% VISUAL DISPLAY (Fixation Image)s
I = imread('Fixation.PNG');
I;imshow(I);
set(gcf,'position',[1600 100  1300  1050]);

% INITIALIZE KEYPRESS
numChannelList = [];
keyspressed = [];

%DEVICE SET UPS
d = daq.getDevices;
s1 = daq.createSession('directsound');
fs = s1.Rate;

%SOUND FILTER GENERATION 
x = wgn(100000,1,1);
if minFreq == 800;
    y1 =  bandpass_butterworth(x,[800 900],fs,1);
    y2 =  bandpass_butterworth(x,[900 1000],fs,1);
    y3 =  bandpass_butterworth(x,[1000 1100],fs,1);
    y4 =  bandpass_butterworth(x,[1100 1200],fs,1);
    y5 =  bandpass_butterworth(x,[1300 1400],fs,1);
    y6 =  bandpass_butterworth(x,[1500 1600],fs,1);
    y7 =  bandpass_butterworth(x,[1600 1700],fs,1);
    y8 =  bandpass_butterworth(x,[1700 1800],fs,1);
end
if maxFreq == 800;
    y1 =  bandpass_butterworth(x,[100 200],fs,1);
    y2 =  bandpass_butterworth(x,[200 300],fs,1);
    y3 =  bandpass_butterworth(x,[300 400],fs,1);
    y4 =  bandpass_butterworth(x,[400 500],fs,1);
    y5 =  bandpass_butterworth(x,[500 600],fs,1);
    y6 =  bandpass_butterworth(x,[600 700],fs,1);
    y7 =  bandpass_butterworth(x,[800 900],fs,1);
    y8 =  bandpass_butterworth(x,[900 1000],fs,1);
end

%CHANNEL GENERATOR
segmentEnd = (100000);
nspeakers = 8;
nspeakergroups1 = 1;
speakerselection1 = cell(1, nspeakergroups1);
nspeakergroups2 = 1;
speakerselection2 = cell(1,nspeakergroups2);
nspeakergroups3 = 1;
speakerselection3 = cell(1,nspeakergroups3);
nspeakergroups4 = 1;
speakerselection4 = cell(1,nspeakergroups4);
nspeakergroups5 = 1;
speakerselection5 = cell(1,nspeakergroups5);
nspeakergroups6 = 1;
speakerselection6 = cell(1,nspeakergroups6);
nspeakergroups7 = 1;
speakerselection7 = cell(1,nspeakergroups7);
nspeakergroups8 = 1;
speakerselection8 = cell(1,nspeakergroups8);

%CREATE INSTANCES & INITIALIZE EACH SOUND CHANNEL
d = daq.getDevices;
s1 = daq.createSession('directsound');
s2 = daq.createSession('directsound');
s3 = daq.createSession('directsound');
s4 = daq.createSession('directsound');
s5 = daq.createSession('directsound');
s6 = daq.createSession('directsound');
s7 = daq.createSession('directsound');
s8 = daq.createSession('directsound');
s1.IsContinuous = true;
s2.IsContinuous = true;
s3.IsContinuous = true;
s4.IsContinuous = true;
s5.IsContinuous = true;
s6.IsContinuous = true;
s7.IsContinuous = true;
s8.IsContinuous = true;
addAudioOutputChannel(s1, 'Audio7', 1:8);
addAudioOutputChannel(s2, 'Audio7', 1:8);
addAudioOutputChannel(s3, 'Audio7', 1:8);
addAudioOutputChannel(s4, 'Audio7', 1:8);
addAudioOutputChannel(s5, 'Audio7', 1:8);
addAudioOutputChannel(s6, 'Audio7', 1:8);
addAudioOutputChannel(s7, 'Audio7', 1:8);
addAudioOutputChannel(s8, 'Audio7', 1:8);
fs = s1.Rate;


%BEGIN EXPERIMENT
for T = 1:numtrials(1);
    
    %RANDOMIZE NUMBER OF SOUNDS
    num1 =randperm(8);
    numSounds = num1(1);
    Sounds = num1(1:numSounds); 

    %RANDOMIZE NUMVER OF CHANNELS
    num2 = randperm(numSounds);
    numChannels = num2(1);
    Channels = (num2(1:numChannels));

    %CALCULATE HOW MANY SOUNDS WILL BE PLAYED PER CHANNEL
    Sounds_per_Channel = floor(numSounds/numChannels);
    Remainder =rem(numSounds,numChannels);
    
    %ASSIGN SOUNDS TO GROUPS
    for X = 1:numChannels;
        if X == 1;
            SoundGroup = Sounds(1:Sounds_per_Channel);
            RemainderGroup = Sounds(numSounds-Remainder+1:numSounds);
            SoundGroup1 = union(SoundGroup,RemainderGroup);
        end
        if X == 2;
            SoundGroup2 = Sounds((Sounds_per_Channel*(X-1))+1:Sounds_per_Channel*X);
        end
        if X == 3;
            SoundGroup3 = Sounds((Sounds_per_Channel*(X-1))+1:Sounds_per_Channel*X);
        end
        if X == 4;
            SoundGroup4 = Sounds((Sounds_per_Channel*(X-1))+1:Sounds_per_Channel*X);
        end
        if X == 5;
            SoundGroup5 = Sounds((Sounds_per_Channel*(X-1))+1:Sounds_per_Channel*X);
        end
        if X == 6;
            SoundGroup6 = Sounds((Sounds_per_Channel*(X-1))+1:Sounds_per_Channel*X);
        end
        if X == 7;
            SoundGroup7 = Sounds((Sounds_per_Channel*(X-1))+1:Sounds_per_Channel*X);
        end
        if X == 8;
            SoundGroup8 = Sounds((Sounds_per_Channel*(X-1))+1:Sounds_per_Channel*X);
        end
    end


    %ASSIGN EACH SOUND GROUP TO A SPEAKER
    C = [];
    for L =  1:numChannels;
        if L == 1;
            for X = 1:length(SoundGroup1);
                C = [C, Channels(L)];
            end
        else
            for X = 1:length(SoundGroup2);
                C = [C, Channels(L)];
            end
        end 
    end

    if length(C) == 1;
        speakerselection1{1} = C(1);
    end
    if length(C) == 2;
        speakerselection1{1} = C(1);
        speakerselection2{1} = C(2);
    end 
    if length(C) == 3;
        speakerselection1{1} = C(1);
        speakerselection2{1} = C(2);
        speakerselection3{1} = C(3);
    end 
    if length(C) == 4;
        speakerselection1{1} = C(1);
        speakerselection2{1} = C(2);
        speakerselection3{1} = C(3);
        speakerselection4{1} = C(4);
    end
    if length(C) ==5;
        speakerselection1{1} = C(1);
        speakerselection2{1} = C(2);
        speakerselection3{1} = C(3);
        speakerselection4{1} = C(4);
        speakerselection5{1} = C(5);
    end
    if length(C) == 6;
        speakerselection1{1} = C(1);
        speakerselection2{1} = C(2);
        speakerselection3{1} = C(3);
        speakerselection4{1} = C(4);
        speakerselection5{1} = C(5);
        speakerselection6{1} = C(6);
    end 
    if length(C) == 7;
        speakerselection1{1} = C(1);
        speakerselection2{1} = C(2);
        speakerselection3{1} = C(3);
        speakerselection4{1} = C(4);
        speakerselection5{1} = C(5);
        speakerselection6{1} = C(6);
        speakerselection7{1} = C(7);
    end
    if length(C) == 8;
        speakerselection1{1} = C(1);
        speakerselection2{1} = C(2);
        speakerselection3{1} = C(3);
        speakerselection4{1} = C(4);
        speakerselection5{1} = C(5);
        speakerselection6{1} = C(6);
        speakerselection7{1} = C(7);
        speakerselection8{1} = C(8);
    end 

    
    %CREATE FINAL SOUND OUTPUTS
    %PLAY SOUNDS
    'PLAYING';
    if cell2mat(speakerselection1) > 0;
    [singleChannelOutput1] = ...
        helper_surround_sound_single_voices(y1, segmentEnd, nspeakers, nspeakergroups1, speakerselection1);
    queueOutputData(s1, singleChannelOutput1);
    startBackground(s1);
    end
    
    if cell2mat(speakerselection2) > 0;
    [singleChannelOutput2] = ...
        helper_surround_sound_single_voices(y2, segmentEnd, nspeakers, nspeakergroups2, speakerselection2);
    queueOutputData(s2, singleChannelOutput2);
    startBackground(s2);
    end
    
    if cell2mat(speakerselection3) > 0;
    [singleChannelOutput3] = ...
        helper_surround_sound_single_voices(y3, segmentEnd, nspeakers, nspeakergroups3, speakerselection3);
     queueOutputData(s3, singleChannelOutput3);
     startBackground(s3);
    end
     
    if cell2mat(speakerselection4) > 0;
    [singleChannelOutput4] = ...
        helper_surround_sound_single_voices(y4, segmentEnd, nspeakers, nspeakergroups4, speakerselection4);
    queueOutputData(s4, singleChannelOutput4);
    startBackground(s4);
    end
    
    if cell2mat(speakerselection5) > 0;
    [singleChannelOutput5] = ...
        helper_surround_sound_single_voices(y5, segmentEnd, nspeakers, nspeakergroups5, speakerselection5);
     queueOutputData(s5, singleChannelOutput5);
     startBackground(s5);
    end
    
    if cell2mat(speakerselection6) > 0;
    [singleChannelOutput6] = ...
        helper_surround_sound_single_voices(y6, segmentEnd, nspeakers, nspeakergroups6, speakerselection6);
    queueOutputData(s6, singleChannelOutput6);
    startBackground(s6);
    end
    
    if cell2mat(speakerselection7) > 0;
    [singleChannelOutput7] = ...
        helper_surround_sound_single_voices(y7, segmentEnd, nspeakers, nspeakergroups7, speakerselection7);
     queueOutputData(s7, singleChannelOutput7);
    startBackground(s7);
    end
     
    if cell2mat(speakerselection8)2 > 0;
    [singleChannelOutput8] = ...
        helper_surround_sound_single_voices(y8, segmentEnd, nspeakers, nspeakergroups8, speakerselection8);
    queueOutputData(s8, singleChannelOutput8);
    startBackground(s8);
    end
    
    pause(2)
%     stop(s1)
%     stop(s2)
%     stop(s3)
%     stop(s4)
%     stop(s5)
%     stop(s6)
%     stop(s7)
%     stop(s8)
    
    %RECORD RESPONSE KEYPRESS
    numChannelList = [numChannelList, numChannels];
    startTime = hat;
    k=0;
    while ~k
        k = waitforbuttonpress;
        totaltime = hat - startTime;
        fprintf('RXN TIME: %s\n',totaltime);
        currkey = get(gcf,'currentcharacter');
        if strcmp(currkey,' ')
            k = 1;
            fprintf('KEYS PRESSED: %s\n',keyspressed);
            close; 
            return1
        else
            k = 0;
        end 
        fprintf('Pressed %s.\n',currkey)
        Text = [minFreq, maxFreq, numSounds,numChannels,str2double(currkey), totaltime];
        dlmwrite(strcat(csvFile,'_test.csv'), Text , '-append', 'precision', 8);
        keyspressed = [keyspressed,str2num(currkey)];
        fprintf('KEYS PRESSED: %s\n',keyspressed);
        k = 1;
    end
    pause(1)
end
close;

%CALCULATE  OVERALL PERCENT CORRECT
correct = 0;
incorrect = 0;


for X = 1:length(numChannelList);
    if numChannelList(X) == keyspressed(X);
        correct = correct + 1;
    else
        incorrect = incorrect + 1;
    end
end

OverallScore = (correct/(incorrect + correct)) * 100;


%CALCULATE PERCENT CORRECT FOR EACH NUMBER OF CHANNELS (To find limit)
correct1 = 0;
incorrect1 = 0; 
correct2 = 0;
incorrect2 = 0;
correct3 = 0;
incorrect3 = 0; 
correct4 = 0;
incorrect4 = 0;
correct5 = 0;
incorrect5 = 0; 
correct6 = 0;
incorrect6 = 0;
correct7 = 0;
incorrect7 = 0; 
correct8 = 0;
incorrect8 = 0;

Score1 = 0;
Score2 = 0;
Score3 = 0;
Score4 = 0;
Score5 = 0;
Score6 = 0;
Score7 = 0;
Score8 = 0;


for X = 1:length(numChannelList);
    if numChannelList(X) == 1;
        if numChannelList(X) == keyspressed(X);
            correct1 = correct1 + 1;
        else 
            incorrect1 = incorrect1 + 1;
        end
        Score1 = (correct1/(incorrect1 + correct1)) * 100;
    end 
    if numChannelList(X) == 2;
        if numChannelList(X) == keyspressed(X);
            correct2 = correct2 + 1;
        else 
            incorrect2 = incorrect2 + 1;
        end
        Score2 = (correct2/(incorrect2 + correct2)) * 100;
    end 
    if numChannelList(X) == 3;
        if numChannelList(X) == keyspressed(X);
            correct3 = correct3 + 1;
        else 
            incorrect3 = incorrect3 + 1;
        end
        Score3 = (correct3/(incorrect3 + correct3)) * 100;
    end 
    if numChannelList(X) == 4;
        if numChannelList(X) == keyspressed(X);
            correct4 = correct4 + 1;
        else 
            incorrect4 = incorrect4 + 1;
        end
        Score4 = (correct4/(incorrect4 + correct4)) * 100;
    end 
    if numChannelList(X) == 5;
        if numChannelList(X) == keyspressed(X);
            correct5 = correct5 + 1;
        else 
            incorrect5 = incorrect5 + 1;
        end
        Score5 = (correct5/(incorrect5 + correct5)) * 100;
    end 
    if numChannelList(X) == 6;
        if numChannelList(X) == keyspressed(X);
            correct6 = correct6 + 1;
        else 
            incorrect6 = incorrect6 + 1;
        end
        Score6 = (correct6/(incorrect6 + correct6)) * 100;
    end 
    if numChannelList(X) == 7;
        if numChannelList(X) == keyspressed(X);
            correct7 = correct7 + 1;
        else 
            incorrect7 = incorrect7 + 1;
        end
        Score7 = (correct7/(incorrect7 + correct7)) * 100;
    end 
    if numChannelList(X) == 8;
        if numChannelList(X) == keyspressed(X);
            correct8 = correct8 + 1;
        else 
            incorrect8 = incorrect8 + 1;
        end
        Score8 = (correct8/(incorrect8 + correct8)) * 100;
    end
      
end

%GRAPH & PRINT RESULTS
X = [Score1, Score2, Score3, Score4, Score5, Score6, Score7, Score8];
numChannelList;
keyspressed;
X;
OverallScore;
bar(X)
ylim([0 100])


