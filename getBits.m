% Reads the audio wav-file "file" and returns the bit array of the audio
% signal. The bit stream is represented by a double array of ones and
% zeros. It also returns the sample rate (fs) in Hertz and the number of bits 
% per sample (nbits) used to encode the data in the file.
% 
% Usage: [X,fs,nbits]=getBits(file)
% Parameter: file - the audio wav file to be read; default is 'thankyou.wav'
% Returns: X     - bit array of the audio data
%          fs    - sample rate [Hz]
%          nbits - number of bits per sample
%
% Example: X = getBits(); % returns the audio data for 'thankyou.wav'
function [X,fs,nbits]=getBits(file)
if nargin<1, 
    file='thankyou.wav';
end
[tmp,fs,nbits]=wavread(file);
%y=int16(2^15*tmp);
y=2^15*tmp;
X=rem(floor(double(abs(y))*pow2(1-16:0)),2);
X(y<=0,1)=1;
X=X(:);