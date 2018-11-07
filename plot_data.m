semilogy(0:10,a(1:11))
hold on;
semilogy(0:15,b);
semilogy(0:15,c);
SNR = 0:10;
u = qfunc(-sqrt(10.^(SNR/10)));
BER = 1/2*(1-u).*(2*u+1);
semilogy(SNR,BER,'o');
semilogy(0:15,0.02*ones(1,16))
legend('QPSK','8QAM','16QAM','QPSK???','BER??')
xlabel('SNR(dB)')
ylabel('BER')
