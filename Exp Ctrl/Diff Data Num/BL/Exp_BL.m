function Exp_BL( X_s, X_t, Y_s, Y_t )
%EXP_MMLTL 此处显示有关此函数的摘要
%   此处显示详细说明
samplenum_list = [500,600,700,800,900,1000,1100];

BL_HL = zeros(3,length(samplenum_list));
BL_RL = zeros(3,length(samplenum_list));
BL_OE = zeros(3,length(samplenum_list));
BL_C = zeros(3,length(samplenum_list));
BL_AP = zeros(3,length(samplenum_list));

for j=1:1:3
    for i=1:1:length(samplenum_list)
        X_sp = X_s(:,1:samplenum_list(i));
        Y_sp = Y_s(:,1:samplenum_list(i));
        X_tp = X_t(:,1:samplenum_list(i));
        Y_tp = Y_t(:,1:samplenum_list(i));
        [HammingLoss,RankingLoss,OneError,Coverage,AveragePrecision,AUC,F1_macro,F1_micro] = BL_Main(X_sp, X_tp, Y_sp, Y_tp);
        BL_HL(j,i) = HammingLoss;
        BL_RL(j,i) = RankingLoss;
        BL_OE(j,i) = OneError;
        BL_C(j,i) = Coverage;
        BL_AP(j,i) = AveragePrecision;
        save('BL.mat','-mat','BL_HL','BL_RL','BL_OE','BL_C','BL_AP');
        Full_Loop = i
    end
end

%% 播放提示音
load chirp
sound(y,Fs)
end

