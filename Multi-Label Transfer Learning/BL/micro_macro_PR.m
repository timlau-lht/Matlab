function [ Precision, Recall, F1, micro_F1 ] = micro_macro_PR( pred , Y ) 

k = size(pred,2);

for i = 1:k
    ind_pos = ( find(Y(:,i)==1) );
    ind_neg = ( find(Y(:,i)== -1) );
    
    TP(i) = length( find( pred(ind_pos,i) == 1 ) );
    FN(i) = length(ind_pos) - TP(i);
    
    FP(i) = length( find( pred(ind_neg,i) == 1 ) );
    TN(i) = length( ind_neg ) - FP(i);
    
    if TP(i) + FP(i) ~= 0
        Precision(i) = TP(i) / ( TP(i) + FP(i) ) ;
    else
        %count = count - 1;
        Precision(i) = 0;
    end
    
    if TP(i) + FN(i) ~=0
        Recall(i) = TP(i) / (TP(i) + FN(i) );
    else 
        %count = count - 1;
        Recall(i) = 0;
    end
    
    if  2*TP(i) + FP(i) + FN(i) ~= 0
        F1(i) = 2 * TP(i) / ( 2*TP(i) + FP(i) + FN(i) );
    else 
        %count = count - 1;
        F1(i) = 0;
    end
    
end

% calculate micro-F1
micro_F1 = 2 * sum(TP) / (2 * sum(TP) + sum(FP) + sum(FN));
F1 = mean(F1);
end