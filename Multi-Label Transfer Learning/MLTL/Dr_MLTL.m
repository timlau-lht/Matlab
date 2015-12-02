function [U, V] = Dr_MLTL( G, U, V, X, lambda1, lambda2 )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%   G是一个d*h的矩阵
%   U是一个d*g的矩阵
%   V是一个h*g的矩阵
%   X_u是未标记数据矩阵，每一列表示一个图像
%   X_l是已标记数据矩阵，每一列表示一个图像

h = size(G,2);
g = size(U,2);
if(g ~= size(V,2))
    error('U和V列数不同');
end

% 固定V 更新U %
I = eye(size(X,1));
A = lambda1 * I;
B = V' * V;
C = - G * V;
U = lyap(A, B, C);
% U更新完毕%
    
% 固定U 更新V %
I = eye(g);
A = U' * U + lambda2 * I;
B = U' * G;   
for i = 1: 1: h
    bi = B(:,i);
    [xi,flag] = pcg(A, bi);%lsqr
    V(i,:) = xi';
end
% V更新完毕%

end

