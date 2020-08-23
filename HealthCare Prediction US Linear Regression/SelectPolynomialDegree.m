function [P,L,GraphMatrixTraining,GraphMatrixTesting] = SelectPolynomialDegree(Xinput,yinput,maxDegree)
    %SELECTPOLYNOMIALDEGREE Summary of this function goes here
    %   Detailed explanation goes here
    P = 1;
    L = 0;
    GraphMatrixTraining = zeros(maxDegree,10);
    GraphMatrixTesting = zeros(maxDegree,10);
    leastError = intmax;
    lambdaList = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';
    for i=2:maxDegree
        
        for j=1:size(lambdaList,1)
            X = Xinput;
            y = yinput;
            %compute theta
            %X = AddPolynomialFeatures(X,1,i);
            %X = AddPolynomialFeatures(X,2,i);
            %X = AddPolynomialFeatures(X,3,i);
            X = AddMultiplePolyFeatures(X, i, [1 2 3]);

            X = MeanNormalization(X);
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
            lambda = lambdaList(j,1);
            [theta, ~] = GradientDecsent(X,y,theta,alpha,iterations,lambda);

            %compute total error
            trainingError = CostFuntion(X, y,theta,lambda);
            testError =  CostFuntion(Xtest, ytest,theta,lambda);
            GraphMatrixTraining(i,j) = trainingError;
            GraphMatrixTesting(i,j) = testError;
            %totalError = trainingError + testError;
            totalError = testError;
            if(totalError<leastError)
                leastError = totalError;
                P = i;
                L = lambdaList(j,1);
            end
        end
    end
end

