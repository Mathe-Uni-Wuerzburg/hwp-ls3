% Simulates a noisy channel with  a bit error probability p. The bit stream
% nutzbits is transmitted over a channel of type type.
%
% Usage: empfangen=simError(nutzbits,p,type)
% Parameter:    nutzbits - bit stream
%               p    - bit error probability
%               type - error generator type
% Returns:  empfangen - received bits after transmission
function empfangen=simError(nutzbits,p,type)
y=zeros(size(nutzbits));
switch type
    case 1
        y = double(rand(size(nutzbits))<p);
    case 2        
        z=2;
        y = double(rand(numel(nutzbits),1)<p/z);
        i=find(y(:));
        if i(end)>numel(y)-z-1, i(end)=[];end 
        for k=1:z-1
            y(i+k)=1;
        end
        y=reshape(y',size(nutzbits,2),size(nutzbits,1))';
end
empfangen=bitxor(y,nutzbits);
