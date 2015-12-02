function [ X_s1,X_s2,Y_s1,Y_s2,X_t1,X_t2,Y_t1,Y_t2] = CreateXandY( TrainData, TestData)
%CREATEXANDY Summary of this function goes here
%   Detailed explanation goes here
Sift_s = TrainData.DSift;
Sift_t = TestData.DSift;
Tag_s = TrainData.Tag;
Tag_t = TestData.Tag;

num_s2 = size(Sift_s,1);
num_s1 = num_s2 / 2;
num_t2 = size(Sift_t,1);
num_t1 = num_t2 / 2;

X_s1 = double(Sift_s(1:num_s1,:)');
X_s2 = double(Sift_s(num_s1 + 1:num_s2,:)');
Y_s1 = double(Tag_s(1:num_s1,:)');
Y_s2 = double(Tag_s(num_s1 + 1:num_s2,:)');

X_t1 = double(Sift_t(1:num_t1,:)');
X_t2 = double(Sift_t(num_t1 + 1:num_t2,:)');
Y_t1 = double(Tag_t(1:num_t1,:)');
Y_t2 = double(Tag_t(num_t1 + 1:num_t2,:)');

end

