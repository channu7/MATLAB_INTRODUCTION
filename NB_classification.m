clear;
close all;
load cancer_dataset;
cd=cancerInputs(:,1:178);
load wine_dataset;
wd=wineInputs;
fm=[cd;wd];
for i=1:size(cd)+size(wd)
 if(i<=9)
 tg(i)=1;
 else
 tg(i)=2;
 end
end
o=fitNaiveBayes(fm,tg);
c=o.predict(fm);
conMat=confusionmat(tg,c)
Accuracy=sum(diag(conMat))/sum(conMat(:))