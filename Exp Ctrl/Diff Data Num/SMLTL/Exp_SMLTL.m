function Exp_SMLTL( X_s, X_t, Y_s, Y_t )
%EXP_MMLTL 此处显示有关此函数的摘要
%   此处显示详细说明
samplenum_list = [500,600,700,800,900,1000,1100];

SMLTL_HL = zeros(3,length(samplenum_list));
SMLTL_RL = zeros(3,length(samplenum_list));
SMLTL_OE = zeros(3,length(samplenum_list));
SMLTL_C = zeros(3,length(samplenum_list));
SMLTL_AP = zeros(3,length(samplenum_list));

for j=1:1:3
    for i=1:1:length(samplenum_list)
        X_sp = X_s(:,1:samplenum_list(i));
        Y_sp = Y_s(:,1:samplenum_list(i));
        X_tp = X_t(:,1:samplenum_list(i));
        Y_tp = Y_t(:,1:samplenum_list(i));
        [HammingLoss,RankingLoss,OneError,Coverage,AveragePrecision,AUC,F1_macro,F1_micro] = SMLTL_Main(X_sp, X_tp, Y_sp, Y_tp);
        SMLTL_HL(j,i) = HammingLoss;
        SMLTL_RL(j,i) = RankingLoss;
        SMLTL_OE(j,i) = OneError;
        SMLTL_C(j,i) = Coverage;
        SMLTL_AP(j,i) = AveragePrecision;
        save('SMLTL.mat','-mat','SMLTL_HL','SMLTL_RL','SMLTL_OE','SMLTL_C','SMLTL_AP');
        Full_Loop = i
    end
end
%% 播放提示音
load chirp
sound(y,Fs)
end

