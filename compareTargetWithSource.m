% This function selects the most suitable suitable siource image for each
% grid cell.
function[minRGBDifference, selectedSourceImg] = compareTargetWithSource(targetMeans, sourceMeans)
    [targetHeight, targetWidth, targetDim] = size(targetMeans);
    [sourceHeight, sourceWidth, sourceDim] = size(sourceMeans);
    
    for k=1:targetHeight
        for j=1:targetWidth
            meanRedTarget = targetMeans(k,j,1);
            meanGreenTarget = targetMeans(k,j,2);
            meanBlueTarget = targetMeans(k,j,3);
            
            for n=1:sourceHeight
                meanRedSource = sourceMeans(n,1);
                meanGreenSource = sourceMeans(n,2);
                meanBlueSource = sourceMeans(n,3);
                
%                 meanRGBDifference(n) = sqrt((meanRedTarget - meanRedSource)^2 + ... 
%                     (meanGreenTarget - meanGreenSource)^2 + ...
%                     (meanBlueTarget - meanBlueSource)^2);
                
                meanRedDifference = abs(meanRedTarget - meanRedSource);
                meanGreenDifference = abs(meanGreenTarget - meanGreenSource);
                meanBlueDifference = abs(meanBlueTarget - meanBlueSource);
                
                meanRGBDifference(n) = meanRedDifference + meanGreenDifference + meanBlueDifference;
            end
            
            % Random
            minRGBDifferences = mink(meanRGBDifference,5);
            randomSourceImageDifference = randsample(minRGBDifferences, 1);
            sourceImageIndex = find(meanRGBDifference==randomSourceImageDifference);
            
            minRGBDifference(k,j) = randomSourceImageDifference;
            selectedSourceImg(k,j) = sourceImageIndex(1);

            % Minimum difference
%             [minRGBDifference(k,j), selectedSourceImg(k,j)] = min(meanRGBDifference);
   
        end
    end
end