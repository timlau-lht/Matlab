function [U, V] = Dr_MLTL( G, U, V, X, XMX, mu, lambda1, lambda2 )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%   G��һ��d*h�ľ���
%   U��һ��d*g�ľ���
%   V��һ��h*g�ľ���
%   X_u��δ������ݾ���ÿһ�б�ʾһ��ͼ��
%   X_l���ѱ�����ݾ���ÿһ�б�ʾһ��ͼ��

h = size(G,2);
g = size(U,2);
if(g ~= size(V,2))
    error('U��V������ͬ');
end

% �̶�V ����U %
I = eye(size(X,1));
A = mu * XMX + lambda1 * I;
B = V' * V;
C = - G * V;
U = lyap(A, B, C);
% U�������%
    
% �̶�U ����V %
I = eye(g);
A = U' * U + lambda2 * I;
B = U' * G;   
for i = 1: 1: h
    bi = B(:,i);
    [xi,flag] = pcg(A, bi);%lsqr
    V(i,:) = xi';
end
% V�������%

end

