% This function converts the bit stream "bits" into wav audio data. The audio signal is
% sent to the standard audio output device with a sample frequency of "fs" Hertz. The standard 
% audio rate is 11025 Hz.
%
% Usage: playWav(bits,fs)
% Parameter:    bits    - a double array containing only ones and zeros reflecting the audio signal
%               fs      - sample frequency [Hz]
function playWav(bits,fs)
if nargin<2, fs=11025;end
rest=mod(length(bits),16);
if rest>0
    bits(end:end+16-rest)=0;
end
x = reshape(bits,length(bits)/16,16);
val = zeros(length(bits)/16,1);
for i=1:15
    val=val+x(:,i+1).*2.^(14-i+1);
end
val = val.*(-1).^x(:,1); % vorzeichen
sound(double(val)/2^15,fs);