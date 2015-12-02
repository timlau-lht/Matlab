function [ X_s1,Y_s1,X_s2,Y_s2,X_s3,Y_s3,X_s4,Y_s4,X_t,Y_t] = CreatXandYbyDiffNum(TrainData, TestData, TrainNum)
%CREATEXANDY Summary of this function goes here
%   Detailed explanation goes here
Sift_s = TrainData.DSift;
Sift_t = TestData.DSift;
Tag_s = TrainData.Tag;
Tag_t = TestData.Tag;

randvec = rand([4,size(Sift_s,1)]);
[~,indvec] = sort(randvec,2);

X_s1 = double(Sift_s(indvec(1,1:TrainNum),:)');
Y_s1 = double(Tag_s(indvec(1,1:TrainNum),:)');
X_s2 = double(Sift_s(indvec(2,1:TrainNum),:)');
Y_s2 = double(Tag_s(indvec(2,1:TrainNum),:)');
X_s3 = double(Sift_s(indvec(3,1:TrainNum),:)');
Y_s3 = double(Tag_s(indvec(3,1:TrainNum),:)');
X_s4 = double(Sift_s(indvec(4,1:TrainNum),:)');
Y_s4 = double(Tag_s(indvec(4,1:TrainNum),:)');

X_t = double(Sift_t');
Y_t = double(Tag_t');
end