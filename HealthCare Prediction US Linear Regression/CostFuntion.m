function [J,grad] = CostFuntion(X, y, theta, lambda)
    %COSTFUNTION Summary of this function goes here
    %   Detailed explanation goes here
    m = length(y);
    J = 0;
    grad = zeros(size(theta));
    
    h = X * theta;%12x1
    J = 1/(2*m) * sum((h - y).^2)+lambda/(2*m)*sum(theta(2:end).^2);

    grad = (1/m) * X'*(h - y);
    grad(2:end) = grad(2:end) +  lambda/m * theta(2:end);
    
    grad = grad(:);
    
end

