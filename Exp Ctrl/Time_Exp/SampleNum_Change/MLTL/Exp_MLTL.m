function Exp_MLTL( X_s, X_t, Y_s, Y_t )
%EXP_MMLTL 此处显示有关此函数的摘要
%   此处显示详细说明

samplenum_list = [500,600,700,800,900,1000,1100,1200];
MLTL_CPU = zeros(1,length(samplenum_list));
MLTL_TOC = zeros(1,length(samplenum_list));

for(i=1:1:length(samplenum_list))
    X_sp = X_s(:,1:samplenum_list(i));
    Y_sp = Y_s(:,1:samplenum_list(i));
    X_tp = X_t(:,1:samplenum_list(i));
    Y_tp = Y_t(:,1:samplenum_list(i));
    [time_cpu, time_toc] = MLTL_Main(X_sp, X_tp, Y_sp, Y_tp);
    MLTL_CPU(1,i) = time_cpu;
    MLTL_TOC(1,i) = time_toc;
    Full_Loop = i
end

save('MLTL.mat','-mat','MLTL_CPU','MLTL_TOC');
%% 播放提示音
load chirp
sound(y,Fs)
end

