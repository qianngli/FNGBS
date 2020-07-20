function [num,part,trnData,trnLab,tstData,tstLab ] = TrainTest( data,lab,trnPer,clsCnt )

clsNum = zeros(1, clsCnt);          %the total number of data for each class
trnNum = zeros(1, clsCnt);          %the number of training data selected for each class
tstNum = zeros(1, clsCnt);          %the number of test data selected for each class

 for i = 1 : clsCnt
   index = find(lab == i);                 
   clsNum(i) = size(index,1);                   
   trnNum(i) = ceil(clsNum(i) * trnPer);        
   tstNum(i) = clsNum(i) - trnNum(i);           
 end
num=[trnNum;tstNum];
 
trnData = [];                       
trnLab = [];                       
tstData = [];                        
tstLab = [];                     

part=[];
for i = 1 : clsCnt
   index = find(lab == i);                  
   random_index = index(randperm(length(index)));
   part{1,i}=random_index;
   
   index = random_index(1:trnNum(i));           
   trnData = [trnData data(index,:)'];         
   trnLab = [trnLab ones(1,length(index))*i];    

   index = random_index(trnNum(i)+1:end);        
   tstData = [tstData data(index,:)'];         
   tstLab = [tstLab ones(1,length(index))*i];    
end
