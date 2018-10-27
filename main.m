%% Clear console and variables
clc
clear all

%% Collect the list of source images
directory = 'Images/test';
fileType = 'jpg';
sourceImages = getSourceImages(directory, fileType);

%% Set size for each source image
resizedSourceImages = resizeSourceImages(sourceImages);

%% Get RGB means for each source image 
meanSource = getMeanSource(resizedSourceImages);