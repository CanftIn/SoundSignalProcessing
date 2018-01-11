function [x, fs, nbits] = mywavread(filename)
% Simulate the old version of the wavread function, reading data, sampling
% rate, sampling bits

    % reading data and sampling rate
    [x, fs] = audioread(filename);
    
    % reading sampling bits
    % info = audioinfo(filename);
    nbits = 16;
    % nbits = info.BitsPerSample;
    
end