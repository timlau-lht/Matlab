function W = MLTL( X_r, Y_r, lambda1, lambda2, k )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%   ��X��׼����Y���Ļ�
% Y_r = center(Y_r);
W_r = eye(size(Y_r, 2));

%����Y�����������˹�����S����
L_r = Hypergraph_Laplacian(Y_r, W_r);
S_r = eye(size(L_r)) - L_r;

% S_r = S_r + realmin * ones(size(S_r));

%����H����
[Eig_Vec, Eig_Val] = eig(S_r);
[~, index] = sort(diag(Eig_Val), 'descend');
H_r_all = Eig_Vec(:,index);
H_r = H_r_all(:,1:k);

W = zeros(size(X_r,2),k);
%��������������ϡ���ʾ
for i = 1:1:k
    beta = larsen(X_r, H_r(:,i), lambda2, lambda1);
    W(:,i) = beta(1,:)';
end

end