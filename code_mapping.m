P=perms([1:8]);
theta = [0:6]/7*2*pi+pi/7;
constellation = [0 cos(theta);0 sin(theta)]; %constellation diagram 
code_table = [[0;0;0],[0;0;1],[0;1;1],[1;0;1],[1;1;1],[1;1;0],[0;1;0],[1;0;0]];
cost_list=zeros(1,length(P)); %store data

for i = 1:length(P)
    new_table = code_table(:,P(i,:));
    cost = 0;
    for j = 1:8
        cost = cost + sum((constellation-constellation(:,j)).^2)*sum((new_table-new_table(:,j)).^2)';
    end
    cost_list(i) = cost;
end

[M,I] = min(cost_list);
code_table = code_table(:,P(I,:)); %overwrite previous code table
save('n_code_table','code_table');