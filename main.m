%% Clear console and variables
clc
clear all

%% Get user inputs
directory = input('Please enter the folder with source images: ','s'); 
% Images/test
fileType = input('Please provide the file type of images (jpg, png, etc.): ','s'); 
%jpg
targetImage = imread(input('Please enter the target image: ','s')); 
% Images/mosaic_target2.jpg
targetImageWidth = input('Please enter the width of the target image: ','s');
targetImageHeight = input('Please enter the height of the target image: ','s');
tilesNum = input('Please input the number of tiles: ','s');
resultImagePath = input('Please input the path where you would like to save mosaic image: ','s');
%Images/result.jpg

%% Collect the list of source images
sourceImages = getSourceImages(directory, fileType);

%% Resize the target image
targetImage = resizeTargetImage(targetImage, targetImageWidth, targetImageHeight);

%% Get tile size based on the number of tile provided by a user
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
imwrite(mosaicImage, resultImagePath);

%% Executed
disp("Executed!!!");