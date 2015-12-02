function Exp_MLTL( X_s, X_t, Y_s, Y_t )
%EXP_MMLTL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

subdim_list = [100,200,300,400,500,600,700,800,900,1000];
MLTL_CPU = zeros(1,length(subdim_list));
MLTL_TOC = zeros(1,length(subdim_list));

for(i=1:1:length(subdim_list))
    [time_cpu, time_toc] = MLTL_Main(X_s, X_t, Y_s, Y_t, subdim_list(i));
    MLTL_CPU(1,i) = time_cpu;
    MLTL_TOC(1,i) = time_toc;
    Full_Loop = i
end

save('MLTL.mat','-mat','MLTL_CPU','MLTL_TOC');
%% ������ʾ��
load chirp
sound(y,Fs)
end

