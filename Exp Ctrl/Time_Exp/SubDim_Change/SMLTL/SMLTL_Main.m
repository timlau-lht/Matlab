function [time_cpu, time_toc] = SMLTL_Main(X_s, X_t, Y_s, Y_t, subdim)
%MAIN Summary of this function goes here
%   Detailed explanation goes here
lambda1 = 1;
lambda2 = 1;
k = subdim;
sigma = 0.35;
alpha = 0.99;
nIter = 100;
% threshold = 0.5;

%% ��ȡX��Y
Labelnum = size(Y_s, 1);
Featnum = size(X_s, 1);
trainum = size(X_s, 2);
testnum = size(X_t, 2);
X_l = normalize(X_s)';
Y_l = Y_s';
X_u = normalize(X_t)';
Y_u = Y_t;

%% ����W
tic;
cpu_start = cputime;
W = MLTL( X_l, Y_l, lambda1, lambda2, k );
time_toc = toc;
cpu_end = cputime;
time_cpu = cpu_end - cpu_start;

% %% ����X_w
% X_lw = W' * X_l';
% X_uw = W' * X_u';
% 
% %% RankSVMѵ����Ԥ��
% svm.type = 'Linear';
% svm.para = [];
% cost = 1;
% lambda_tol = 1e-6;
% norm_tol = 1e-4;
% max_iter = 50;
% Y_p = zeros(Labelnum,testnum);
% [Weights,Bias,SVs,Weights_sizepre,Bias_sizepre,svm_used,~]=RankSVM_train(X_lw',Y_l',svm,cost,lambda_tol,norm_tol,max_iter);
% [RankScore,~,PreLabel] = RankSVM_test(X_uw',Y_p,svm_used,Weights,Bias,SVs,Weights_sizepre,Bias_sizepre);
% 
% %% ����Ԥ����
% [HammingLoss,RankingLoss,OneError,Coverage,AveragePrecision,AUC,F1_macro,F1_micro] = Evaluate(Y_u, RankScore, PreLabel);

end

