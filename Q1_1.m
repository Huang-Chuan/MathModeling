disp('processing QPSK')
QAM_4;
disp('processing 8 QAM')
QAM_8;
disp('processing 16 QAM')
QAM_16;

load_mat = matfile('4QAM_sim.mat');
QAM4_BER_sim = load_mat.ratio;
load_mat = matfile('8QAM_sim.mat');
QAM8_BER_sim = load_mat.ratio;
load_mat = matfile('16QAM_sim.mat');
QAM16_BER_sim = load_mat.ratio;
load_mat = matfile('BER_4QAM.mat');
QAM4_BER = load_mat.BER;

semilogy(0:10,QAM4_BER_sim(1:11),0:15,QAM8_BER_sim,0:15,QAM16_BER_sim);
hold on;
semilogy(0:10,QAM4_BER(1:11),'o');

semilogy(0:15,0.02*ones(1,16));

legend('QPSK','8QAM','16QAM','QPSK理论','BER门限')
xlabel('SNR(dB)')
ylabel('BER')


