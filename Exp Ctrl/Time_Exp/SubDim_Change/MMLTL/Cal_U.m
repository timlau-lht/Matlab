function [U, time_cpu, time_toc] = Cal_U(X_l, Y_l, X_u, subdim)
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
eps = 1e-3;

% ����M����
M = MMD(trainum, testnum);

% �����ʼ��U, V����
U = rand(size(G,1),subdim);
V = rand(size(G,2),subdim);
U_old = U;
V_old = V;
% �ϲ�X_l��X_u
X = [X_l';X_u']';
XMX = X * M * X';
[U, V] = Dr_MLTL( G, U_old, V_old, X, XMX, mu, gamma1, gamma2 );
err_u = norm(U - U_old,'fro');
err_v = norm(V - V_old,'fro');
iter = 0;

tic;
cpu_start = cputime;
% while (min(err_u,err_v) > eps && iter < 70)
while (min(err_u,err_v) > eps && iter < 50)
    U_old = U;
    V_old = V;
    [U, V] = Dr_MLTL( G, U_old, V_old, X, XMX, mu, gamma1, gamma2 );
    err_u = norm(U - U_old,'fro');
    err_v = norm(V - V_old,'fro');
    min(err_u,err_v)
    iter = iter + 1
end
time_toc = toc;
cpu_end = cputime;
time_cpu = cpu_end - cpu_start;

end