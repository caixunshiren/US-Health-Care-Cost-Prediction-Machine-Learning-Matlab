function [newX,newy] = removeOutlierEntries(X,y, outliers)
    %REMOVEOUTLIERENTRIES Summary of this function goes here
    %   outlier is in form (i error(i))
    newX = zeros(1, size(X,2));
    newy = zeros(1,1);
    outliers = outliers(:,1);
    for i=1:size(y,1)
        Append = true;
        for j=1:size(outliers,1)
            if(i == outliers(j,1))
                Append = false;
            end
        end
        if(Append)
            newX = [newX; X(i, :)];
            newy = [newy; y(i, :)];
        end
    end
    newX = newX(2:end,:);
    newy = newy(2:end,:);
    
end

