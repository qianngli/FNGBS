close all
clear 
clc

%% upload dataset

load PaviaU;
img_src= paviaU;
clear paviaU;
load PaviaU_gt;
img_gt = paviaU_gt;
clear paviaU_gt;
Label = img_gt(:);


[M,N,Band] = size(img_src);
sz = size(img_src);
img_src = double(img_src);
img_src = reshape(img_src,sz(1)*sz(2),sz(3));
img_src = img_src';

%% normalization

imgz = img_src(:);
imgz = mapminmax(imgz',0,1);
img = reshape(imgz,Band,M*N);
 
%% compute information entrop

totalNumber = M*N;
randNumber = floor(totalNumber*0.01);
for i=1:Band
    randIndex(i,:) = randperm(totalNumber,randNumber);
    imgx(i,:) = img(i,randIndex(i,:));
end

for i = 1:Band
    mVar(i) = Entrop(imgx(i,:));
end

mVar = (mVar - min(mVar)) / (max(mVar) - min(mVar));
mVar = mVar';

%% compute similarity matrix
S = get_D(img');

%% band selection
range = 5:30; % the number of selected bands

for classNum = 1:length(range)    
    K = range(classNum) + 1;
    bandSubspace = subspacePart(S,Band,K);
    selectedBand = repBands(K, bandSubspace,S,mVar);
    RecommandBand(classNum) = recomBand(selectedBand,img); 
    bandSubspace = [];
    selectedBand = [];
end

cftool  % Note that we adopt cruve fitting tool to fit values of discrete probability  




