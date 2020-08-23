function [meanError, sd, outliers] = PredictionError(theta,X,y,outlierThreshold)
    %PREDICTIONERROR Summary of this function goes here
    %   Detailed explanation goes here
    error = abs(X * theta - y)./ y;
    outliers = zeros(1,2);
    for i=1:size(X,1)
       if(error(i,1) > outlierThreshold)
           outliers = [outliers; [i error(i, 1)]];
       end
    end
    outliers = outliers(2:end,:);
    sumOutlier = sum(outliers,1);
    meanError = (sum(error) - sumOutlier(1,2)) / (size(X,1) - size(outliers,1));
    sd = std(error);
    
    
end

