clear all;
clc;
close all;
%Dendrogram using single linkage with Euclidean and Cityblock distance measure for cancer  dataset
load cancer_dataset;
ds = cancerInputs;
X = linkage(ds,'single','euclidean');
figure,dendrogram(X),title 'Euclidean Distance';
pause(1);
Y = linkage(ds,'single','cityblock');
figure,dendrogram(Y),,title 'Cityblock Distance';;
pause(1);


%%
clear all;
clc;
close all;
%Average linkage with Euclidean and Cityblock distance measure for wine dataset.

load wine_dataset;
ds = wineInputs;
X = linkage(ds,'single','euclidean');
figure,dendrogram(X),title 'Euclidean Distance';
pause(1);
Y = linkage(ds,'single','cityblock');
figure,dendrogram(Y),,title 'Cityblock Distance';;
pause(1);

%%
%complete linkage with Euclidean and Cityblock distance measure for glass dataset.
clear all;
clc;
close all;
load glass_dataset;
ds = glassInputs;
X = linkage(ds,'single','euclidean');
figure,dendrogram(X),title 'Euclidean Distance';
pause(1);
Y = linkage(ds,'single','cityblock');
figure,dendrogram(Y),,title 'Cityblock Distance';;
pause(1);

%%
