# US-Health-Care-Cost-Prediction-Machine-Learning-Matlab
Predicting Health care cost in the US using linear regression. 

To run this machine learning problem:
1) run FindBestPolynomialAndLambda.m to select best polynomial P and lambda  ----> result will be saved in BestLambdaAndDegreePolynomial.mat
2) run Main.m to train using the training set and evaluate using test set. ----> trained parameters will be saved in BestTheta.mat
3) now you are done and you can let the algorithm to predict your own health care cost using PredictCost.m. Note that if you get a negative cost that means your healthcare cost is 0.
