clear all;
code_mapping;
% SNR = -6:15; %SNR in dB
% 
% u = qfunc(-sqrt(10.^(SNR/10)));
% BER = 1/2*(1-u).*(2*u+1);
% semilogy(SNR,BER,'o');


%--------------simulation-------------------------------%
N = 1e5; % num of symbols
theta = [0:6]/7*2*pi+pi/7;
constellation = [0 cos(theta);0 sin(theta)];
%code_table = [[1;0;1],[0;0;0],[1;0;0],[0;1;0],[1;1;0],[0;1;1],[1;1;1],[0;0;1]];
%code_table = [[0;0;0],[0;0;1],[0;1;1],[1;0;1],[1;1;1],[1;1;0],[0;1;0],[1;0;0]];
load_mat = matfile('n_code_table.mat');
code_table = load_mat.code_table;
%bit_sent =round(2*randi(2,2,N)-3); %convert to [-1 , 1];
bit_sent = randi(2,3,N)-1;   %bits to send only 1 and 0
con_sent = bit2con_8QAM_new(bit_sent,code_table,constellation);
%decode_contellation = zeros(2,N);

decode_bits=zeros(3,N);

ratio = zeros(1,16);

for SNR = 0: 15
%SNR = 5% SNR in dB
%
sigma = sqrt(1/10.^(SNR/10)/2); 


%bit_sent = [1;0]*ones(1,N);


noise = sigma*randn(2,N);

r = con_sent+noise;





%
for i = 1:N
     d = [sum((r(:,i)-constellation(:,1)).^2) sum((r(:,i)-constellation(:,2)).^2) sum((r(:,i)-constellation(:,3)).^2) sum((r(:,i)-constellation(:,4)).^2)...
     sum((r(:,i)-constellation(:,5)).^2) sum((r(:,i)-constellation(:,6)).^2) sum((r(:,i)-constellation(:,7)).^2) sum((r(:,i)-constellation(:,8)).^2)];
     [M I] = min(d);
     decode_bits(:,i) = code_table(:,I);
%     decode_contellation(:,i) = constellation(:,I);
%    decode_bits(:,i)=decode(r(:,i));
end
%[number1,ratio1] = symerr(decode_contellation,bit_sent);
[number1,ratio1] = symerr(decode_bits,bit_sent);
%ratio1=sum(sum(abs(bit_sent-decode_bits)))/(2*N);

ratio(SNR+1) = ratio1;
end
load_mat = matfile('8QAM_sim.mat');
old_ratio = load_mat.ratio;

semilogy([0:15],ratio)
hold on
%load('ratio_8QAM.mat');
semilogy([0:15],old_ratio)
legend('new','old')
xlabel('SNR(dB)')
ylabel('BER')