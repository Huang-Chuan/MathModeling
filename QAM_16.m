clear all;

% SNR = -6:15; %SNR in dB
% 
% u = qfunc(-sqrt(10.^(SNR/10)));
% BER = 1/2*(1-u).*(2*u+1);
% semilogy(SNR,BER,'o');


%--------------simulation-------------------------------%
N = 1e5; % num of symbols

%bit_sent =round(2*randi(2,2,N)-3); %convert to [-1 , 1];
bit_sent = randi(2,4,N)-1;   %bits to send only 1 and 0
con_sent = bit2con_16QAM(bit_sent);
%decode_contellation = zeros(2,N);

decode_bits=zeros(4,N);

ratio = zeros(1,16);

for SNR = 0: 15
%SNR = 5% SNR in dB
%SNR;
sigma = sqrt(10/10.^(SNR/10)/2); 


%bit_sent = [1;0]*ones(1,N);


noise = sigma*randn(2,N);

r = con_sent+noise;







constellation = [[-3;3],[-3;1],[-3;-1],[-3;-3],...
				 [-1;3],[-1;1],[-1;-1],[-1;-3],...
				 [1;3],[1;1],[1;-1],[1;-3],...
				 [3;3],[3;1],[3;-1],[3;-3]];
code_table = [[1;0;1;1],[1;0;0;1],[1;0;0;0],[1;0;1;0],...
			  [0;0;1;1],[0;0;0;1],[0;0;0;0],[0;0;1;0],...
			  [0;1;1;1],[0;1;0;1],[0;1;0;0],[0;1;1;0],...
			  [1;1;1;1],[1;1;0;1],[1;1;0;0],[1;1;1;0]];



%
for i = 1:N
     d = [sum((r(:,i)-constellation(:,1)).^2) sum((r(:,i)-constellation(:,2)).^2) sum((r(:,i)-constellation(:,3)).^2) sum((r(:,i)-constellation(:,4)).^2)...
          sum((r(:,i)-constellation(:,5)).^2) sum((r(:,i)-constellation(:,6)).^2) sum((r(:,i)-constellation(:,7)).^2) sum((r(:,i)-constellation(:,8)).^2)...
          sum((r(:,i)-constellation(:,9)).^2) sum((r(:,i)-constellation(:,10)).^2) sum((r(:,i)-constellation(:,11)).^2) sum((r(:,i)-constellation(:,12)).^2)...
          sum((r(:,i)-constellation(:,13)).^2) sum((r(:,i)-constellation(:,14)).^2) sum((r(:,i)-constellation(:,15)).^2) sum((r(:,i)-constellation(:,16)).^2)];
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
save('16QAM_sim.mat','ratio')
%hold on
%semilogy(0:15,ratio)