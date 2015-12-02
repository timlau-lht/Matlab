function Exp_LIFT( X_s, X_t, Y_s, Y_t )
%EXP_MMLTL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
LIFT_HL = zeros(1,4);
LIFT_RL = zeros(1,4);
LIFT_OE = zeros(1,4);
LIFT_C = zeros(1,4);
LIFT_AP = zeros(1,4);
for(i=1:1:4)
    [HammingLoss,RankingLoss,OneError,Coverage,AveragePrecision,AUC,F1_macro,F1_micro] = LIFT_Main(X_s, X_t, Y_s, Y_t);
    LIFT_HL(1,i) = HammingLoss;
    LIFT_RL(1,i) = RankingLoss;
    LIFT_OE(1,i) = OneError;
    LIFT_C(1,i) = Coverage;
    LIFT_AP(1,i) = AveragePrecision;
    Full_Loop = i
end

save('LIFT.mat','-mat','LIFT_HL','LIFT_RL','LIFT_OE','LIFT_C','LIFT_AP');
%% ������ʾ��
load chirp
sound(y,Fs)
end

