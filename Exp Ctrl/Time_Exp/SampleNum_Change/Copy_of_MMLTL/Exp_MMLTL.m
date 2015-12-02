function Exp_MMLTL( X_s, X_t, Y_s, Y_t )
%EXP_MMLTL 此处显示有关此函数的摘要
%   此处显示详细说明

samplenum_list = [500,600,700,800,900,1000,1100,1200];
MMLTL_CPU = zeros(1,length(samplenum_list));
MMLTL_TOC = zeros(1,length(samplenum_list));

for(i=1:1:length(samplenum_list))
    X_sp = X_s(:,1:samplenum_list(i));
    Y_sp = Y_s(:,1:samplenum_list(i));
    X_tp = X_t(:,1:samplenum_list(i));
    Y_tp = Y_t(:,1:samplenum_list(i));
    [time_cpu, time_toc] = MMLTL_Main(X_sp, X_tp, Y_sp, Y_tp);
    MMLTL_CPU(1,i) = time_cpu;
    MMLTL_TOC(1,i) = time_toc;
    Full_Loop = i
end

save('MMLTL.mat','-mat','MMLTL_CPU','MMLTL_TOC');
%% 播放提示音
load chirp
sound(y,Fs)
end

