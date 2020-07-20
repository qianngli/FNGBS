function [ preLab ] = knn( trnData,trnLab,tstData,tstLab,k )
        
[trnRow,trnCol] = size(trnData);
[tstRow,tstCol] = size(tstData);

preLab = [];
for i=1:tstCol
    testLine = tstData(:,i);
    
    diffMat = repmat(testLine,[1,trnCol])-trnData;
    distanceMat = sqrt( sum(diffMat.^2) );
    [distance num] = sort(distanceMat,'ascend');
    len = min(k,length(distance));
    preLab = [preLab mode(trnLab(num(1:len)))];
end

end