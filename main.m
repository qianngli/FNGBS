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
 
%% compute information entropy

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
range = [5,7,10,12,15,20,25,30,35,40,45,50]; % the number of selected bands

for classNum = 1:length(range)    
    K = range(classNum) + 1;
    bandSubspace = subspacePart(S,Band,K);
    selectedBand = repBands(K, bandSubspace,S,mVar);

%% separate test set and training set
    clsCnt = length(unique(Label))-1; 
    [tstNum,num,part,trnData,trnLab,tstData,tstLab] = dataClss(clsCnt,selectedBand,img,Label);

%% classification
    for classifier = 1:2
        switch classifier
            case 1
        %% knn classification
            k = 5;  
            preLab = knn(trnData,trnLab,tstData,tstLab,k);
            Knn_result_acc(1,classNum) = accuracy( tstLab,preLab,clsCnt,tstNum );

            case 2
        %% SVM classification
            model = svmtrain(trnLab',trnData','-c 10000.000000 -g 0.500000 -m 500 -t 2 -q');
            [ptest,acctest,dec_values2] = svmpredict(tstLab',tstData',model);
            Svm_result_acc(1,classNum) = accuracy( tstLab,ptest',clsCnt,tstNum );

        end
    end
    disp(['the number of selected bands:', num2str(K-1),'  KNN: ',num2str(Knn_result_acc(1,classNum)),'   SVM: ',num2str(Svm_result_acc(1,classNum))]);
    bandSubspace = [];
    selectedBand = [];
end


