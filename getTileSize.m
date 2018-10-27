function[tileSize] = getTileSize(targetImage, tilesNum)
   [targetHeight, targetWidth, targetDim] = size(targetImage);
    targetArea = targetHeight * targetWidth;
    tileArea = targetArea/str2num(tilesNum);
    tileSize = sqrt(tileArea);
end