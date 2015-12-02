function Exp_LIFT( X_s, X_t, Y_s, Y_t )
%EXP_MMLTL 此处显示有关此函数的摘要
%   此处显示详细说明
samplenum_list = [500,600,700,800,900,1000,1100];

LIFT_HL = zeros(3,length(samplenum_list));
LIFT_RL = zeros(3,length(samplenum_list));
LIFT_OE = zeros(3,length(samplenum_list));
LIFT_C = zeros(3,length(samplenum_list));
LIFT_AP = zeros(3,length(samplenum_list));

for j=1:1:3
    for i=1:1:length(samplenum_list)
        X_sp = X_s(:,1:samplenum_list(i));
        Y_sp = Y_s(:,1:samplenum_list(i));
        X_tp = X_t(:,1:samplenum_list(i));
        Y_tp = Y_t(:,1:samplenum_list(i));
        [HammingLoss,RankingLoss,OneError,Coverage,AveragePrecision,AUC,F1_macro,F1_micro] = LIFT_Main(X_sp, X_tp, Y_sp, Y_tp);
        LIFT_HL(j,i) = HammingLoss;
        LIFT_RL(j,i) = RankingLoss;
        LIFT_OE(j,i) = OneError;
        LIFT_C(j,i) = Coverage;
        LIFT_AP(j,i) = AveragePrecision;

        save('LIFT.mat','-mat','LIFT_HL','LIFT_RL','LIFT_OE','LIFT_C','LIFT_AP');
        Full_Loop = i
    end
end

%% 播放提示音
load chirp
sound(y,Fs)
end

