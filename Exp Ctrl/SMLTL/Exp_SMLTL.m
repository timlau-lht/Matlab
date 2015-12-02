function Exp_SMLTL( X_s, X_t, Y_s, Y_t )
%EXP_MMLTL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
Time_Start = datestr(now);
MMLTL_HL = zeros(2,4);
MMLTL_RL = zeros(2,4);
MMLTL_OE = zeros(2,4);
MMLTL_C = zeros(2,4);
MMLTL_AP = zeros(2,4);
for(i=1:1:4)
    [HammingLoss,RankingLoss,OneError,Coverage,AveragePrecision,AUC,F1_macro,F1_micro] = SMLTL_Main(X_s, X_t, Y_s, Y_t);
    MMLTL_HL(1,i) = HammingLoss;
    MMLTL_RL(1,i) = RankingLoss;
    MMLTL_OE(1,i) = OneError;
    MMLTL_C(1,i) = Coverage;
    MMLTL_AP(1,i) = AveragePrecision;
    [HammingLoss,RankingLoss,OneError,Coverage,AveragePrecision,AUC,F1_macro,F1_micro] = SMLTL_Main(X_t, X_s, Y_t, Y_s);
    MMLTL_HL(2,i) = HammingLoss;
    MMLTL_RL(2,i) = RankingLoss;
    MMLTL_OE(2,i) = OneError;
    MMLTL_C(2,i) = Coverage;
    MMLTL_AP(2,i) = AveragePrecision;
    Full_Loop = i
end
Time_End = datestr(now);
save('SMLTL.mat','-mat','MMLTL_HL','MMLTL_RL','MMLTL_OE','MMLTL_C','MMLTL_AP','Time_Start','Time_End');
%% ������ʾ��
load chirp
sound(y,Fs)
end

