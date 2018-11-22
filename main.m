function[] = main(targetImage, targetImagePath, targetImageWidth, targetImageHeight, tilesNum, resultImagePath)

    disp("Started...");
    
    directory = getImageClass(targetImagePath);
    
    % Collect the list of source images
    sourceImages = getSourceImages(directory, 'jpg');
    disp("Source images collected...");
    
    % Resize the target image
    targetImage = resizeTargetImage(targetImage, targetImageWidth, targetImageHeight);
    disp("Target image resized...");
    
    % Get tile size based on the number of tile provided by a user
    tileSize = getTileSize(targetImage, tilesNum);
    % Get tiles across and down the image
    [tilesAcross, tilesDown] = getTileDimensions(targetImage, tilesNum, tileSize);
    
    % Apply grid on target image and get grid cells
    targetGridCells = getGridCells(targetImage, tileSize, tilesAcross, tilesDown);
    disp("Grid applied to the target image...");
   
    % Get mean RGB for each grid cell
    meanTargetCells = getMeanTargetCells(targetGridCells);
    
    % Set size for each source image
    resizedSourceImages = resizeSourceImages(sourceImages, tileSize);
        
    % Get RGB means for each source image 
    meanSource = getMeanSource(resizedSourceImages);
    
    % Compare each target cell with the set of source images and find the most suitable tile
    [minRGBDifference, selectedSourceImages] = compareTargetWithSource(meanTargetCells, meanSource);
    
    % Generate mosaic
    mosaicImage = createMosaicImage(resizedSourceImages, selectedSourceImages);
    
    % Increase RGB colour saturation
    mosaicImageInc = increaseIntensity(mosaicImage);
   
    % Write the image to the result file
    imwrite(mosaicImage, resultImagePath);

    disp("Executed!!!");