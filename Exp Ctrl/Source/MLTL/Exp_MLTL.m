function Exp_MLTL( X_s, X_t, Y_s, Y_t )
%EXP_MMLTL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

MLTL_HL = zeros(1,4);
MLTL_RL = zeros(1,4);
MLTL_OE = zeros(1,4);
MLTL_C = zeros(1,4);
MLTL_AP = zeros(1,4);
for(i=1:1:4)
        [HammingLoss,RankingLoss,OneError,Coverage,AveragePrecision,AUC,F1_macro,F1_micro] = MLTL_Main(X_s, X_t, Y_s, Y_t);
        MLTL_HL(1,i) = HammingLoss;
        MLTL_RL(1,i) = RankingLoss;
        MLTL_OE(1,i) = OneError;
        MLTL_C(1,i) = Coverage;
        MLTL_AP(1,i) = AveragePrecision;
        Full_Loop = i
end

save('MMLTL.mat','-mat','MMLTL_HL','MMLTL_RL','MMLTL_OE','MMLTL_C','MMLTL_AP');
%% ������ʾ��
load chirp
sound(y,Fs)
end

