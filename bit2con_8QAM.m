function con = bit2con_8QAM(s,code_table)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
con = zeros(2,length(s)); % constellation 
for i = 1 : length(s)
    if all(s(:,i)==code_table(:,1))
            con(:,i)=[0;1+sqrt(3)];
    elseif all(s(:,i)==code_table(:,2)) 
            con(:,i)=[-1;1];
    elseif all(s(:,i)==code_table(:,3))    
            con(:,i)=[-1-sqrt(3);-1]; 
    elseif  all(s(:,i)==code_table(:,4))
            con(:,i)=[-1;-1];                   
    elseif  all(s(:,i)==code_table(:,5))
            con(:,i)=[0;-1-sqrt(3)];  
    elseif  all(s(:,i)==code_table(:,6))
            con(:,i)=[1;-1];  
    elseif  all(s(:,i)==code_table(:,7))
            con(:,i)=[1+sqrt(3);0];      
    else  
            con(:,i)=[1;1];      
    
    
    end   
end

end

%code_table = [[0;0;0],[0;0;1],[0;1;1],[1;0;1],[1;1;1],[1;1;0],[0;1;0],[1;0;0]];