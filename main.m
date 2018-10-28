%% Clear console and variables
clc
clear all

%% Collect the list of source images
% directory = input('Please enter the folder with source images: ','s');
directory = 'Images/test';
% fileType = input('Please provide the file type of images (jpg, png, etc.): ','s');
fileType = 'jpg';
sourceImages = getSourceImages(directory, fileType);

%% Get tile size based on the number of tile provided by a user
targetImage = imread('Images/mosaic_target2.jpg');
tilesNum = input('Please input the number of tiles: ','s');
tileSize = getTileSize(targetImage, tilesNum);

%% Get tiles across and down the image
[tilesAcross, tilesDown] = getTileDimensions(targetImage, tilesNum, tileSize);

%% Apply grid on target image and get grid cells
targetGridCells = getGridCells(targetImage, tileSize, tilesAcross, tilesDown);

%% Get mean RGB for each grid cell
targetCellsMeans = getMeanTargetCells(targetGridCells);

%% Set size for each source image
resizedSourceImages = resizeSourceImages(sourceImages, tileSize);

%% Get RGB means for each source image 
meanSource = getMeanSource(resizedSourceImages);

%% Executed
disp("Executed!!!");