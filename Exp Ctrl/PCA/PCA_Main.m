function [HammingLoss,RankingLoss,OneError,Coverage,AveragePrecision,AUC,F1_macro,F1_micro] = PCA_Main(X_s, X_t, Y_s, Y_t)
%MAIN Summary of this function goes here
%   Detailed explanation goes here

%% 读取X，Y
Labelnum = size(Y_s, 1);
Featnum = size(X_s, 1);
trainum = size(X_s, 2);
testnum = size(X_t, 2);

X_l = X_s;
X_u = X_t;
Y_l = Y_s;
Y_u = Y_t;

%% 计算E
subdim = 500;
X = [X_l';X_u']';
[Y,E,D] = pca(X, subdim);

%% 计算X_w
X_lw = E' * (X_l - mean(X_l, 2) * ones(1,size(X_l,2)));
X_uw = E' * (X_u - mean(X_u, 2) * ones(1,size(X_u,2)));

%% RankSVM训练并预测
svm.type = 'Linear';
svm.para = [];
cost = 1;
lambda_tol = 1e-6;
norm_tol = 1e-4;
max_iter = 50;
Y_p = zeros(Labelnum,testnum);
[Weights,Bias,SVs,Weights_sizepre,Bias_sizepre,svm_used,~]=RankSVM_train(X_lw',Y_l,svm,cost,lambda_tol,norm_tol,max_iter);
[RankScore,~,PreLabel] = RankSVM_test(X_uw',Y_p,svm_used,Weights,Bias,SVs,Weights_sizepre,Bias_sizepre);

%% 将结果存入文件中
save('RankScore.mat','-mat','RankScore');
save('PreLabel.mat','-mat','PreLabel');

[HammingLoss,RankingLoss,OneError,Coverage,AveragePrecision,AUC,F1_macro,F1_micro] = Evaluate(Y_u, RankScore, PreLabel);

%% 播放提示音
load chirp
sound(y,Fs)

end

