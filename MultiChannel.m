load handel
d = daq.getVendors()
%
% Create a data acquisition session using |directSound| as the vendor ID.
% DirectSound sound cards are available on all windows platforms.
%
s = daq.createSession('directsound')
