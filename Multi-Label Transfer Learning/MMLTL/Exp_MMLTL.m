function Exp_MMLTL( X_s, X_t, Y_s, Y_t )
%EXP_MMLTL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

MMLTL_HL = zeros(1,4);
MMLTL_RL = zeros(1,4);
MMLTL_OE = zeros(1,4);
MMLTL_C = zeros(1,4);
MMLTL_AP = zeros(1,4);
for(i=1:1:4)
    [HammingLoss,RankingLoss,OneError,Coverage,AveragePrecision,AUC,F1_macro,F1_micro] = MMLTL_Main(X_s, X_t, Y_s, Y_t);
    MMLTL_HL(1,i) = HammingLoss;
    MMLTL_RL(1,i) = RankingLoss;
    MMLTL_OE(1,i) = OneError;
    MMLTL_C(1,i) = Coverage;
    MMLTL_AP(1,i) = AveragePrecision;
    Full_Loop = i
end

save('MMLTL.mat','-mat','MMLTL_HL','MMLTL_RL','MMLTL_OE','MMLTL_C','MMLTL_AP');
%% ������ʾ��
load chirp
sound(y,Fs)
end

