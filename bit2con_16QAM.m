function con = bit2con_16QAM(s)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
con = zeros(2,length(s)); % constellation 
for i = 1 : length(s)
    if all(s(:,i)==[1;0;1;1])
            con(:,i)=[-3;3];
    elseif all(s(:,i)==[1;0;0;1]) 
            con(:,i)=[-3;1];
    elseif all(s(:,i)==[1;0;0;0])    
            con(:,i)=[-3;-1]; 
    elseif  all(s(:,i)==[1;0;1;0])
            con(:,i)=[-3;-3];                   
    elseif  all(s(:,i)==[0;0;1;1])
            con(:,i)=[-1;3];  
    elseif  all(s(:,i)==[0;0;0;1])
            con(:,i)=[-1;1];   
    elseif  all(s(:,i)==[0;0;0;0])
            con(:,i)=[-1;-1];      
    elseif  all(s(:,i)==[0;0;1;0])
            con(:,i)=[-1;-3];     
    elseif  all(s(:,i)==[0;1;1;1])
            con(:,i)=[1;3];                 
    elseif  all(s(:,i)==[0;1;0;1])
            con(:,i)=[1;1];   
    elseif  all(s(:,i)==[0;1;0;0])
            con(:,i)=[1;-1];   
    elseif  all(s(:,i)==[0;1;1;0])
            con(:,i)=[1;-3];  
    elseif  all(s(:,i)==[1;1;1;1])
            con(:,i)=[3;3];  
    elseif  all(s(:,i)==[1;1;0;1])
            con(:,i)=[3;1];  
    elseif  all(s(:,i)==[1;1;0;0])
            con(:,i)=[3;-1];  
    else  
            con(:,i)=[3;-3];     
    
    
    end   
end

end

