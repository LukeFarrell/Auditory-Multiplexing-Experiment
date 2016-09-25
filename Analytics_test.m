numChannelList = [1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8]
keyspressed =    [2,2,2,3,4,3,4,5,1,2,2,5,5,8,8,6,1,3,2,4,6,5,4,2,1,2,3,4,6,7,7,7]

correct = 0
incorrect = 0
for X = 1:length(numChannelList);
    if numChannelList(X) == keyspressed(X);
        correct = correct + 1;
    else
        incorrect = incorrect + 1;
    end
end

OverallScore = (correct/(incorrect + correct)) * 100

correct1 = 0
incorrect1 = 0 
correct2 = 0
incorrect2 = 0
correct3 = 0
incorrect3 = 0 
correct4 = 0
incorrect4 = 0
correct5 = 0
incorrect5 = 0 
correct6 = 0
incorrect6 = 0
correct7 = 0
incorrect7 = 0 
correct8 = 0
incorrect8 = 0

Score1 = 0
Score2 = 0
Score3 = 0
Score4 = 0
Score5 = 0
Score6 = 0
Score7 = 0
Score8 = 0


for X = 1:length(numChannelList);
    if numChannelList(X) == 1;
        if numChannelList(X) == keyspressed(X);
            correct1 = correct1 + 1
        else 
            incorrect1 = incorrect1 + 1
        end
        Score1 = (correct1/(incorrect1 + correct1)) * 100
    end 
    if numChannelList(X) == 2;
        if numChannelList(X) == keyspressed(X);
            correct2 = correct2 + 1
        else 
            incorrect2 = incorrect2 + 1
        end
        Score2 = (correct2/(incorrect2 + correct2)) * 100
    end 
    if numChannelList(X) == 3;
        if numChannelList(X) == keyspressed(X);
            correct3 = correct3 + 1
        else 
            incorrect3 = incorrect3 + 1
        end
        Score3 = (correct3/(incorrect3 + correct3)) * 100
    end 
    if numChannelList(X) == 4;
        if numChannelList(X) == keyspressed(X);
            correct4 = correct4 + 1
        else 
            incorrect4 = incorrect4 + 1
        end
        Score4 = (correct4/(incorrect4 + correct4)) * 100
    end 
    if numChannelList(X) == 5;
        if numChannelList(X) == keyspressed(X);
            correct5 = correct5 + 1
        else 
            incorrect5 = incorrect5 + 1
        end
        Score5 = (correct5/(incorrect5 + correct5)) * 100
    end 
    if numChannelList(X) == 6;
        if numChannelList(X) == keyspressed(X);
            correct6 = correct6 + 1
        else 
            incorrect6 = incorrect6 + 1
        end
        Score6 = (correct6/(incorrect6 + correct6)) * 100
    end 
    if numChannelList(X) == 7;
        if numChannelList(X) == keyspressed(X);
            correct7 = correct7 + 1
        else 
            incorrect7 = incorrect7 + 1
        end
        Score7 = (correct7/(incorrect7 + correct7)) * 100
    end 
    if numChannelList(X) == 8;
        if numChannelList(X) == keyspressed(X);
            correct8 = correct8 + 1
        else 
            incorrect8 = incorrect8 + 1
        end
        Score8 = (correct8/(incorrect8 + correct8)) * 100
    end
   
end




X = [Score1, Score2, Score3, Score4, Score5, Score6, Score7, Score8];
numChannelList
keyspressed
X
bar(X)
ylim([0 100])