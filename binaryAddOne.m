% revesed style!
function b = binaryAddOne(b) 
    i = 1;
    for i=1:max(size(b))
       if (b(i) == 0)
           b(i) = 1;
           break;
       else
           b(i) = 0;
       end
    end
end