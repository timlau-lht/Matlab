function Exp_PCA( X_s, X_t, Y_s, Y_t )
%EXP_MMLTL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

PCA_HL = zeros(1,4);
PCA_RL = zeros(1,4);
PCA_OE = zeros(1,4);
PCA_C = zeros(1,4);
PCA_AP = zeros(1,4);
for(i=1:1:1)
    [HammingLoss,RankingLoss,OneError,Coverage,AveragePrecision,AUC,F1_macro,F1_micro] = PCA_Main(X_s, X_t, Y_s, Y_t);
    PCA_HL(1,i) = HammingLoss;
    PCA_RL(1,i) = RankingLoss;
    PCA_OE(1,i) = OneError;
    PCA_C(1,i) = Coverage;
    PCA_AP(1,i) = AveragePrecision;
    Full_Loop = i
end

save('PCA.mat','-mat','PCA_HL','PCA_RL','PCA_OE','PCA_C','PCA_AP');
%% ������ʾ��
load chirp
sound(y,Fs)
end

