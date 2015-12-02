function [ HammingLoss,RankingLoss,OneError,Coverage,Average_Precision,AUC,F1_macro,F1_micro] = LIFT_Main(TrainX, TestX, TrainY, TestY)
%MAIN 此处显示有关此函数的摘要
%   此处显示详细说明
%Set the ratio parameter used by LIFT
ratio=0.1;

% Set the kernel type used by Libsvm
svm.type='Linear';
svm.para=[];

train_data = double(TrainX');
train_target = double(TrainY);
train_target(train_target==0) = -1;
test_data = double(TestX');
test_target = double(TestY);
test_target(test_target==0) = -1;

% Calling the main function LIFT
[HammingLoss,RankingLoss,OneError,Coverage,Average_Precision,Outputs,Pre_Labels]=LIFT(train_data,train_target,test_data,test_target,ratio,svm);
AUC = -1;
F1_macro = -1;
F1_micro = -1;

end

