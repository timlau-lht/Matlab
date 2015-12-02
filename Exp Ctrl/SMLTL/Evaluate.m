function [HammingLoss,RankingLoss,OneError,Coverage,AveragePrecision,AUC,F1_macro,F1_micro] = Evaluate(Y_u, RankScore, PreLabel)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%% 读取外部数据
Y_p = PreLabel;
Y_r = RankScore;

%% 调整Y数据
Y_u(Y_u == 0) = -1;
Y_p(Y_p == 0) = -1;

%% 调用评价函数评价预测结果
HammingLoss = Hamming_loss(Y_p, Y_u);
OneError = One_error(Y_r, Y_u);
Coverage = coverage(Y_r, Y_u);
RankingLoss = Ranking_loss(Y_r, Y_u);
AveragePrecision = Average_precision(Y_r, Y_u);
AUC = Area_Under_the_roc_Curve( Y_r, Y_u);
[~, ~, F1_macro, F1_micro ] = micro_macro_PR( Y_p , Y_u);

end

