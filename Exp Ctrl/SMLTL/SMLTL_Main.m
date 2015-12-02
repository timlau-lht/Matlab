function [HammingLoss,RankingLoss,OneError,Coverage,AveragePrecision,AUC,F1_macro,F1_micro] = SMLTL_Main(X_s, X_t, Y_s, Y_t)
%MAIN Summary of this function goes here
%   Detailed explanation goes here
lambda1 = 1;
lambda2 = 1;
k = 500;
sigma = 0.35;
alpha = 0.99;
nIter = 100;
% threshold = 0.5;

%% 读取X，Y
Labelnum = size(Y_s, 1);
Featnum = size(X_s, 1);
trainum = size(X_s, 2);
testnum = size(X_t, 2);
X_l = normalize(X_s)';
Y_l = Y_s';
X_u = normalize(X_t)';
Y_u = Y_t;

%% 计算W
W = MLTL( X_l, Y_l, lambda1, lambda2, k );

%% 计算X_w
X_lw = W' * X_l';
X_uw = W' * X_u';

%% RankSVM训练并预测
svm.type = 'Linear';
svm.para = [];
cost = 1;
lambda_tol = 1e-6;
norm_tol = 1e-4;
max_iter = 50;
Y_p = zeros(Labelnum,testnum);
[Weights,Bias,SVs,Weights_sizepre,Bias_sizepre,svm_used,~]=RankSVM_train(X_lw',Y_l',svm,cost,lambda_tol,norm_tol,max_iter);
[RankScore,~,PreLabel] = RankSVM_test(X_uw',Y_p,svm_used,Weights,Bias,SVs,Weights_sizepre,Bias_sizepre);

%% 评价预测结果
[HammingLoss,RankingLoss,OneError,Coverage,AveragePrecision,AUC,F1_macro,F1_micro] = Evaluate(Y_u, RankScore, PreLabel);

end

