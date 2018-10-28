function[cellMeans] = getMeanTargetCells(targetGridCells)
    [height, width] = size(targetGridCells);
    for k=1:height
        for j=1:width
            [cellMeans(k,j,1), cellMeans(k,j,2), cellMeans(k,j,3)] = ... 
                getMeanRGB(targetGridCells{k,j});
        end
    end
end