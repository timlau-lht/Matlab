function [time_cpu, time_toc] = PCA_Main(X_s, X_t, Y_s, Y_t, subdim)
%MAIN Summary of this function goes here
%   Detailed explanation goes here

%% ∂¡»°X£¨Y
Labelnum = size(Y_s, 1);
Featnum = size(X_s, 1);
trainum = size(X_s, 2);
testnum = size(X_t, 2);

X_l = X_s;
X_u = X_t;
Y_l = Y_s;
Y_u = Y_t;

%% º∆À„E
%X = [X_l';X_u']';
tic;
cpu_start = cputime;
[Y,E,D] = pca(X_l, subdim);
time_toc = toc;
cpu_end = cputime;
time_cpu = cpu_end - cpu_start;

% 
% %% º∆À„X_w
% X_lw = E' * (X_l - mean(X_l, 2) * ones(1,size(X_l,2)));
% X_uw = E' * (X_u - mean(X_u, 2) * ones(1,size(X_u,2)));
% 
% %% RankSVM—µ¡∑≤¢‘§≤‚
% svm.type = 'Linear';
% svm.para = [];
% cost = 1;
% lambda_tol = 1e-6;
% norm_tol = 1e-4;
% max_iter = 50;
% Y_p = zeros(Labelnum,testnum);
% [Weights,Bias,SVs,Weights_sizepre,Bias_sizepre,svm_used,~]=RankSVM_train(X_lw',Y_l,svm,cost,lambda_tol,norm_tol,max_iter);
% [RankScore,~,PreLabel] = RankSVM_test(X_uw',Y_p,svm_used,Weights,Bias,SVs,Weights_sizepre,Bias_sizepre);
% 
% [HammingLoss,RankingLoss,OneError,Coverage,AveragePrecision,AUC,F1_macro,F1_micro] = Evaluate(Y_u, RankScore, PreLabel);

end

