%% Clear console and variables
clc
clear all

%% Collect the list of source images
directory = input('Please enter the folder with source images: ','s');
% directory = 'Images/test';
fileType = input('Please provide the file type of images (Images/test, png, etc.): ','s');
% fileType = 'jpg';
sourceImages = getSourceImages(directory, fileType);

%% Resize the target image
targetImage = imread(input('Please enter the target image: ','s'));
targetImageWidth = input('Please enter the width of the target image: ','s');
targetImageHeight = input('Please enter the height of the target image: ','s');
targetImage = resizeTargetImage(targetImage, targetImageWidth, targetImageHeight);
% targetImage = imread('Images/mosaic_target2.jpg');

%% Get tile size based on the number of tile provided by a user
tilesNum = input('Please input the number of tiles: ','s');
tileSize = getTileSize(targetImage, tilesNum);

%% Get tiles across and down the image
[tilesAcross, tilesDown] = getTileDimensions(targetImage, tilesNum, tileSize);

%% Apply grid on target image and get grid cells
targetGridCells = getGridCells(targetImage, tileSize, tilesAcross, tilesDown);

%% Get mean RGB for each grid cell
meanTargetCells = getMeanTargetCells(targetGridCells);

%% Set size for each source image
resizedSourceImages = resizeSourceImages(sourceImages, tileSize);

%% Get RGB means for each source image 
meanSource = getMeanSource(resizedSourceImages);

%% Compare each target cell with the set of source images and find the most suitable tile
[minRGBDifference, selectedSourceImages] = compareTargetWithSource(meanTargetCells, meanSource);

%% Generate mosaic
mosaicImage = createMosaicImage(resizedSourceImages, selectedSourceImages);
resultImagePath = input('Please input the path where you would like to save mosaic image: ','s');
% imwrite(mosaicImage,'Images/result.jpg');
imwrite(mosaicImage, resultImagePath);

%% Executed
disp("Executed!!!");