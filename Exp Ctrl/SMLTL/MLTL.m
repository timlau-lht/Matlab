function W = MLTL( X_r, Y_r, lambda1, lambda2, k )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%   将X标准化，Y中心化
% Y_r = center(Y_r);
W_r = eye(size(Y_r, 2));

%计算Y矩阵的拉普拉斯矩阵和S矩阵
L_r = Hypergraph_Laplacian(Y_r, W_r);
S_r = eye(size(L_r)) - L_r;

% S_r = S_r + realmin * ones(size(S_r));

%计算H矩阵
[Eig_Vec, Eig_Val] = eig(S_r);
[~, index] = sort(diag(Eig_Val), 'descend');
H_r_all = Eig_Vec(:,index);
H_r = H_r_all(:,1:k);

W = zeros(size(X_r,2),k);
%计算样本参数的稀疏表示
for i = 1:1:k
    beta = larsen(X_r, H_r(:,i), lambda2, lambda1);
    W(:,i) = beta(1,:)';
end

end