function M = MMD( num_l, num_u )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

M = zeros(num_l + num_u);
for i = 1:1:size(M,1)
    for j = 1:1:size(M,2)
        if i <= num_l && j <= num_l
            M(i,j) = 1/(num_l^2);
        else if i > num_l && j > num_l
                M(i,j) = 1/(num_u^2);
            else
                M(i,j) = -1/(num_l * num_u);
            end
        end
    end
end

end

