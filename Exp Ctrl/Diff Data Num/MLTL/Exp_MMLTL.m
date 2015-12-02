function Exp_MMLTL( X_s, X_t, Y_s, Y_t )
%EXP_MMLTL 此处显示有关此函数的摘要
%   此处显示详细说明
samplenum_list = [500,600,700,800,900,1000,1100];

MLTL_HL = zeros(3,length(samplenum_list));
MLTL_RL = zeros(3,length(samplenum_list));
MLTL_OE = zeros(3,length(samplenum_list));
MLTL_C = zeros(3,length(samplenum_list));
MLTL_AP = zeros(3,length(samplenum_list));

for j=1:1:3
    for i=1:1:length(samplenum_list)
        X_sp = X_s(:,1:samplenum_list(i));
        Y_sp = Y_s(:,1:samplenum_list(i));
        X_tp = X_t(:,1:samplenum_list(i));
        Y_tp = Y_t(:,1:samplenum_list(i));
        [HammingLoss,RankingLoss,OneError,Coverage,AveragePrecision,AUC,F1_macro,F1_micro] = MMLTL_Main(X_sp, X_tp, Y_sp, Y_tp);
        MLTL_HL(j,i) = HammingLoss;
        MLTL_RL(j,i) = RankingLoss;
        MLTL_OE(j,i) = OneError;
        MLTL_C(j,i) = Coverage;
        MLTL_AP(j,i) = AveragePrecision;
        save('MLTL.mat','-mat','MLTL_HL','MLTL_RL','MLTL_OE','MLTL_C','MLTL_AP');
        Full_Loop = i
    end
end

%% 播放提示音
load chirp
sound(y,Fs)
end

