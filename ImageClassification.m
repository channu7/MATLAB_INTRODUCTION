close all;
clear all;
%read images from directory 
dr=uigetdir();
A=dir([dr,'\*.jpg']);
for i=1:size(A)
 B=strcat(dr,'\',A(i).name);
 %reading color images 
 rgb=imread(B);
 %convert to gray
 gr=rgb2gray(rgb);
 %Texture and gradiant feature
 glcm=graycomatrix(gr);
 rf=rangefilt(rgb);
 e=entropyfilt(gr);
 %feature matrix
 FM(i,1)=mean2(glcm);
 FM(i,2)=std2(glcm);
 FM(i,3)=mean2(rf);
 FM(i,4)=std2(rf);
 FM(i,5)=mean2(e);
 FM(i,6)=std2(e);
end
dr=uigetdir();
X=dir([dr,'\*.jpg']);
j=1;
for i=size(A)+1:size(A)+size(X)
 B=strcat(dr,'\',X(j).name);
 rgb=imread(B);
 gr=rgb2gray(rgb);
 %Texture and gradiant feature
 glcm=graycomatrix(gr);
 rf=rangefilt(rgb);
 e=entropyfilt(gr);
 FM(i,1)=mean2(glcm);
 FM(i,2)=std2(glcm);
 FM(i,3)=mean2(rf);
 FM(i,4)=std2(rf);
 FM(i,5)=mean2(e);
 FM(i,6)=std2(e);
 j=j+1;
end
tr1=FM(1:7,:);
ts1=FM(8:11,:);
5
tr2=FM(12:16,:);
ts2=FM(17:20,:);
trset=[tr1;tr2];
tsset=[ts1;ts2];
% classes names
for i=1:size(trset)
 if(i<=3)
 tg(i,1)=1;
 else
 tg(i,1)=2;
 end
end
% classes names for confusion matrix
for i=1:size(tsset)
 if(i<=5)
 tsg(i,1)=1;
 elseif(i>5&&i<=8)
 tsg(i,1)=1;
 else
 tsg(i,1)=2; 
 end
end
%SVM algorithm for classification
svmStruct=fitcsvm(trset,tg);
svmClassifier=predict(svmStruct,tsset);
confusionMatrix=confusionmat(tsg,svmClassifier)
Accuracy=sum(diag(confusionMatrix))/sum(confusionMatrix(:))
