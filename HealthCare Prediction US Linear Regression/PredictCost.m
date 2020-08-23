load('BestTheta.mat');

%  ----------------------enter the condition here -------------------
% age	bmi	children	isFemale	isSmoker	isNorthwest	isNortheast	isSouthwest
Xpredict = [49 19.8 2 1 0 0 1 0];

% --------------------------------------------------------------------

Xpredict = AddPolynomialFeatures(Xpredict,1,P);
Xpredict = AddPolynomialFeatures(Xpredict,2,P);
Xpredict = AddPolynomialFeatures(Xpredict,3,P);

Xpredict = (Xpredict - mu) ./ sigma;

Xpredict = [1, Xpredict];

cost = Xpredict * theta;

cost