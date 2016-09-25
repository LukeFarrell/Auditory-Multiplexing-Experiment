

I = imread('Fixation.PNG');
I;imshow(I);
set(gcf,'position',[1600 100  1300  1050]);


keyspressed = [];
k=0;
while ~k
    k = waitforbuttonpress;
    currkey = get(gcf,'currentcharacter');
    if strcmp(currkey,' ')
        k = 1;
        fprintf('KEYS PRESSED: %s\n',keyspressed);
        close; 
        return
    else
        k = 0;
    end 
    if isempty(keyspressed)
        keyspressed = currkey;
    end
    lastkey = keyspressed(end);
    fprintf('Pressed %s.\n',currkey)This 
    if ~strcmp(currkey,lastkey);
        keyspressed = [keyspressed,currkey];
    end
end
