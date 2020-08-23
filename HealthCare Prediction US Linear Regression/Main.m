% T = readtable(['insuranceEdited.csv']);
data = dlmread('insuranceEditedVersion3.csv',',',1,0);
X = data(:,1:(end-1));
y = data(:,end);
%age	bmi	children	isFemale	isSmoker	isNorthwest	isNortheast	isSouthwest
%perform any feature addition here

load('BestLambdaAndDegreePolynomial.mat');
OutlierThreshold = 0.9;
polyPos = [1 2 3];

%X = AddPolynomialFeatures(X,1,P);
%X = AddPolynomialFeatures(X,2,P);
%X = AddPolynomialFeatures(X,3,P);
X = AddMultiplePolyFeatures(X,P,polyPos);

%end
[X mu sigma] = MeanNormalization(X);
X = [ones(size(X,1),1), X];

%spliting into two sets
Xtest = X(1001:1338, :);
ytest = y(1001:1338, :);

X = X(1:1000, :);
y = y(1:1000, :);

%gradient descent
theta = zeros(size(X,2),1);
iterations = 1000;
alpha = 0.01;
[theta, J] = GradientDecsent(X,y,theta,alpha,iterations,lambda);

clf('reset')

hold on

%plot cost function vs iterations
plot(J);

theta;

%display training set error
[TrainingSetError, TrainingSetSd, TrainingOutliers] = PredictionError(theta,X,y, OutlierThreshold);
TrainingSetError
TrainingSetSd
%TrainingOutliers
size(TrainingOutliers)

%display test set error
[TestSetError, TestSetSd, TestOutliers] = PredictionError(theta,Xtest,ytest, OutlierThreshold);
TestSetError
TestSetSd
%TestOutlier
size(TestOutliers)

[X, y] = removeOutlierEntries(X,y,TrainingOutliers);
[Xtest, ytest] = removeOutlierEntries(Xtest,ytest,TestOutliers);



% ----------------------- second run after removing outliers ------------


%gradient descent
theta = zeros(size(X,2),1);
iterations = 1000;
alpha = 0.01;
[theta, J2] = GradientDecsent(X,y,theta,alpha,iterations,lambda);

%plot cost function vs iterations
plot(J2);

hold off

theta;

%display training set error
[TrainingSetError, TrainingSetSd, TrainingOutliers] = PredictionError(theta,X,y, OutlierThreshold);
TrainingSetError
TrainingSetSd
%TrainingOutliers
%size(TrainingOutliers)

%display test set error
[TestSetError, TestSetSd, TestOutlier] = PredictionError(theta,Xtest,ytest, OutlierThreshold);
TestSetError
TestSetSd
%TestOutlier
%size(TestOutlier)

save('BestTheta.mat', 'theta', 'mu', 'sigma', 'P');