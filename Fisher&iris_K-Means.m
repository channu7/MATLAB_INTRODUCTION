clear all;
load fisheriris;
%creation of datasets total 2500 data sets
a = meas(1:25,:);
b = meas(26:75,:);
c = meas(76:150,:);
all_data=[a;b;c];
% %plot of data sets
plot (a(:,1),a(:,2),'.'); hold on
plot (b(:,1),b(:,2),'.');
plot (c(:,1),c(:,2),'.');
IDX=kmeans(all_data,2);
for k=1:size(all_data)
 text(all_data(k,1),all_data(k,2), num2str(IDX(k))); hold on;
end