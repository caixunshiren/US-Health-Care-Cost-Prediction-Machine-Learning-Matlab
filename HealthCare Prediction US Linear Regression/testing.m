polyPos = [1 2 3];
P = 4;
data = dlmread('insuranceEditedVersion3.csv',',',1,0);
X = data(:,1:(end-1));
y = data(:,end);
X = AddMultiplePolyFeatures(X,P,polyPos);

X;