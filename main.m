%% Clear console and variables
clc
clear all

%% Collect the list of source images
directory = 'Images/test';
fileType = 'jpg';
sourceImages = getSourceImages(directory, fileType);

%% Get RGB means for each tile 
meanSource = getMeanSource(sourceImages);
% meansSource