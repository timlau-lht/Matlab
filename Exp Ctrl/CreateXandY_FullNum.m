function [ X_s,Y_s,X_t,Y_t] = CreateXandY_FullNum( TrainData, TestData)
%CREATEXANDY Summary of this function goes here
%   Detailed explanation goes here
Sift_s = TrainData.DSift;
Sift_t = TestData.DSift;
Tag_s = TrainData.Tag;
Tag_t = TestData.Tag;

X_s = double(Sift_s');
Y_s = double(Tag_s');

X_t = double(Sift_t');
Y_t = double(Tag_t');

end

