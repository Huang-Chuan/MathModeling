function con = bit2con(s)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
con = zeros(2,length(s)); % constellation 
for i = 1 : length(s)
    if all(s(:,i)==[1;0])
            con(:,i)=[1;1];
    elseif all(s(:,i)==[0;1]) 
            con(:,i)=[1;-1];
    elseif all(s(:,i)==[0;0])    
            con(:,i)=[-1;-1]; 
    else           %all(r(:,i)==[1;1])
            con(:,i)=[-1;1];                   
    end   
end

end

