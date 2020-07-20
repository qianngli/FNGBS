function [tstNum,num,part,trnData,trnLab,tstData,tstLab ] = dataClss( clsCnt,selectedBand,img,Label )
    selectedBand = sort(selectedBand);
    newData = img(selectedBand,:);
    trnPer = 0.1; 
    [num,part,trnData,trnLab,tstData,tstLab] = TrainTest(newData',Label,trnPer,clsCnt);
    tstNum = zeros(1,clsCnt);
    for i = 1:clsCnt
        index = find(tstLab == i);
        tstNum(i) = length(index);
    end
end

