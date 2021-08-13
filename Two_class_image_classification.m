clear all;
clc;
dr='/Car';% or 
%dr=uigetdir();
A=dir([dr,'\*.jpg']);
global FM;
for i=1:size(A)
 B=strcat(dr,'\',A(i).name);
 
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
end
%dr=uigetdir();
dr='/Mobile';
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
7
 FM(i,4)=std2(rf);
 FM(i,5)=mean2(e);
 FM(i,6)=std2(e);
 j=j+1;
end
for i=1:size(A)+size(X)
 if(i<=11)
 Label(i,1)=1;
 else
 Label(i,1)=2;
 end
end
for i=1:size(Label)
 if(i<=5)
 tsg(i,1)=2;
 elseif(i>5&&i<=11)
 tsg(i,1)=1;
 elseif(i>11&&i<=15)
 tsg(i,1)=1; 
 else
 tsg(i,1)=2;
 end
end
O1 = fitNaiveBayes(FM,Label);
C1 = O1.predict(FM);
confusionMatrix = confusionmat(tsg,C1) 
Accuracy=sum(diag(cMat1))/sum(cMat1(:))