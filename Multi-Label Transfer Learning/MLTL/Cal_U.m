function U = Cal_U(X_l, Y_l, X_u)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

%% ��ȡ�ⲿ����
trainum = size(X_l, 2);
testnum = size(X_u, 2);

% �������G
G = X_l * Y_l';

%% ���U��V
% �Ż��㷨�������
mu = 50;
gamma1 = 1;
gamma2 = 1;
eps = 1e-2;
subdim = 500;

% ����M����
M = MMD(trainum, testnum);

% �����ʼ��U, V����
U = rand(size(G,1),subdim);
V = rand(size(G,2),subdim);
U_old = U;
V_old = V;
% �ϲ�X_l��X_u
X = [X_l';X_u']';
[U, V] = Dr_MLTL( G, U_old, V_old, X, gamma1, gamma2 );
err_u = norm(U - U_old,'fro');
err_v = norm(V - V_old,'fro');
iter = 0;

% while (min(err_u,err_v) > eps && iter < 70)
while (min(err_u,err_v) > eps )
    U_old = U;
    V_old = V;
    [U, V] = Dr_MLTL( G, U_old, V_old, X, gamma1, gamma2 );
    err_u = norm(U - U_old,'fro');
    err_v = norm(V - V_old,'fro');
    min(err_u,err_v);
    iter = iter + 1;
    %X = [X_l';X_u']';
    %temp = norm(G-U*V','fro') + mu * trace(U' * X * M * X' * U) + gamma1 * norm(U,'fro') + gamma2 * norm(V,'fro')
end

end