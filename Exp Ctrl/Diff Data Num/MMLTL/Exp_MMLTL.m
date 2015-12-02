function Exp_MMLTL( X_s, X_t, Y_s, Y_t )
%EXP_MMLTL 此处显示有关此函数的摘要
%   此处显示详细说明
samplenum_list = [500,600,700,800,900,1000,1100];

MMLTL_HL = zeros(3,length(samplenum_list));
MMLTL_RL = zeros(3,length(samplenum_list));
MMLTL_OE = zeros(3,length(samplenum_list));
MMLTL_C = zeros(3,length(samplenum_list));
MMLTL_AP = zeros(3,length(samplenum_list));

for j=1:1:3
    for i=1:1:length(samplenum_list)
        X_sp = X_s(:,1:samplenum_list(i));
        Y_sp = Y_s(:,1:samplenum_list(i));
        X_tp = X_t(:,1:samplenum_list(i));
        Y_tp = Y_t(:,1:samplenum_list(i));
        [HammingLoss,RankingLoss,OneError,Coverage,AveragePrecision,AUC,F1_macro,F1_micro] = MMLTL_Main(X_sp, X_tp, Y_sp, Y_tp);
        MMLTL_HL(j,i) = HammingLoss;
        MMLTL_RL(j,i) = RankingLoss;
        MMLTL_OE(j,i) = OneError;
        MMLTL_C(j,i) = Coverage;
        MMLTL_AP(j,i) = AveragePrecision;
        save('MMLTL.mat','-mat','MMLTL_HL','MMLTL_RL','MMLTL_OE','MMLTL_C','MMLTL_AP');
        Full_Loop = i
    end
end


%% 播放提示音
load chirp
sound(y,Fs)
end

