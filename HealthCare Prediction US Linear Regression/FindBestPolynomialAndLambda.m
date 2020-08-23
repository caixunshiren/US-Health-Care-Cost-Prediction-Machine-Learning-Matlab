data = dlmread('insuranceEditedVersion3.csv',',',1,0);
X = data(:,1:(end-1));
y = data(:,end);
%age	bmi	children	isFemale	isMale	isSmoker	isNorthwest	isNortheast	isSouthwest	isSoutheast
%perform any feature addition here

[P, lambda, GTrain, GTest] = SelectPolynomialDegree(X, y, 10);
P
lambda

GTrain(:,1);
GTest(:,1);

save('BestLambdaAndDegreePolynomial.mat', 'P', 'lambda');

hold on

plot(GTrain(:,1));
plot(GTest(:,1));

hold off