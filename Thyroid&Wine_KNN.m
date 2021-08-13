clear all;
clc;
load thyroid_dataset;
load wine_dataset;
tr1=thyroidInputs(1:15,1:178);
ts1=thyroidInputs(16:21,1:178);
tr2=wineInputs(1:8,:);
ts2=wineInputs(9:13,:);
trset=[tr1;tr2];
tsset=[ts1;ts2];
for i=1:size(trset)
 if(i<=8)
 tg(i,1)=1;
 else
 tg(i,1)=2;
 end
end
for i=1:size(tsset)
 if(i<=5)
 tsg(i,1)=2;
 else
 tsg(i,1)=1; 
 end
end
knnClassifier=knnclassify(tsset,trset,tg);
confusionMatrix=confusionmat(tsg,knnClassifier)
Accuracy=sum(diag(confusionMatrix))/sum(confusionMatrix(:))