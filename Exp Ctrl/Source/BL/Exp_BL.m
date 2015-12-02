function Exp_BL( X_s, X_t, Y_s, Y_t )
%EXP_MMLTL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
BL_HL = zeros(1,4);
BL_RL = zeros(1,4);
BL_OE = zeros(1,4);
BL_C = zeros(1,4);
BL_AP = zeros(1,4);
for(i=1:1:4)
    [HammingLoss,RankingLoss,OneError,Coverage,AveragePrecision,AUC,F1_macro,F1_micro] = BL_Main(X_s, X_t, Y_s, Y_t);
    BL_HL(1,i) = HammingLoss;
    BL_RL(1,i) = RankingLoss;
    BL_OE(1,i) = OneError;
    BL_C(1,i) = Coverage;
    BL_AP(1,i) = AveragePrecision;
    Full_Loop = i
end
save('BL.mat','-mat','BL_HL','BL_RL','BL_OE','BL_C','BL_AP');
%% ������ʾ��
load chirp
sound(y,Fs)
end

