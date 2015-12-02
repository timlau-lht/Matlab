function [Y,E,D] = pca(X, p)

% do PCA on image patches
%
% INPUT variables:
% X                  matrix with image patches as columns
%
% OUTPUT variables:
% Y                  the project matrix of the input data X without whiting
% E                  principal component transformation (orthogonal)
% D                  variances of the principal components

X = X- mean(X,2) * ones(1,size(X,2));

% Calculate the eigenvalues and eigenvectors of the new covariance matrix.
%covarianceMatrix = X*X'/size(X,2); %求出其协方差矩阵
%E是特征向量构成，它的每一列是特征向量，D是特征值构成的对角矩阵
%这些特征值和特征向量都没有经过排序
[U, S, V] = svd(X);
dimD = min(size(S,1),size(S,2));
D(1:dimD, 1:dimD) = S(1:dimD, 1:dimD);
D = D^2;
E = U;

d = abs(diag(D));

% %通过阈值thr选取前p个特征值和特征向量
% dummy = abs(d);
% dumsum = sum(dummy);
% dummy = dummy / dumsum;
% p = 1;
% while thr > 0
%     thr = thr - dummy(p);
%     p = p + 1;
% end
% p = p - 1;

E = E(:,1:p);
Y = E'*X;
d = d(1:p,:);
D = d;  %D由特征值从大到小构成


end

