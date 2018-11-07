function con = bit2con_8QAM_new(s,code_table,constellation)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
con = zeros(2,length(s)); % constellation 
for i = 1 : length(s)
    if all(s(:,i)==code_table(:,1))
            con(:,i)=constellation(:,1);
    elseif all(s(:,i)==code_table(:,2)) 
            con(:,i)=constellation(:,2);
    elseif all(s(:,i)==code_table(:,3))    
            con(:,i)=constellation(:,3); 
    elseif  all(s(:,i)==code_table(:,4))
            con(:,i)=constellation(:,4);                   
    elseif  all(s(:,i)==code_table(:,5))
            con(:,i)=constellation(:,5);  
    elseif  all(s(:,i)==code_table(:,6))
            con(:,i)=constellation(:,6);  
    elseif  all(s(:,i)==code_table(:,7))
            con(:,i)=constellation(:,7);      
    else  
            con(:,i)=constellation(:,8);      
    
    
    end   
end

end

%code_table = [[0;0;0],[0;0;1],[0;1;1],[1;0;1],[1;1;1],[1;1;0],[0;1;0],[1;0;0]];