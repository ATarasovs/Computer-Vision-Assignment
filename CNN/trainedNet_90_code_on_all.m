%code for convolutional neural network classifier

%create labels for images, 0=manmade, 1=natural
labels_training(1:650,1)=0;
labels_training(651:1300,1)=1;

labels_validation(1:100,1)=0;
labels_validation(101:200,1)=1;

% labels_test(1:250,1)=0;
% labels_test(251:500,1)=1;

%manage image files
%training set, 400 manmade and 400 natural images
imds_training=imageDatastore({'U:\CV assignment\Images\val_test\all_manmade','U:\CV assignment\Images\val_test\all_natural'});
imds_training.Labels=categorical(labels_training');%assign labels to the images
imds_training.ReadSize=numpartitions(imds_training);%resize images
imds_training.ReadFcn = @(loc)imresize(imread(loc),[50,50]);%resize images

%validation set, 100 manmade and 100 natural images
imds_validation=imageDatastore({'U:\CV assignment\Images\val_test\manmade_validation','U:\CV assignment\Images\val_test\natural_validation'});
imds_validation.Labels=categorical(labels_validation');%assign labels to the images
imds_validation.ReadSize=numpartitions(imds_validation);%resize images
imds_validation.ReadFcn = @(loc)imresize(imread(loc),[50,50]);%resize images

%test images, 250 manmdade and 250 test images
% imds_test=imageDatastore({'U:\CV assignment\Images\manmade_test','U:\CV assignment\Images\natural_test'});
% % imds_test.Labels=categorical(labels_test');
% imds_test.ReadSize=numpartitions(imds_test);%resize images
% imds_test.ReadFcn = @(loc)imresize(imread(loc),[50,50]);%resize images

%define layers and their properties
layers = [
    imageInputLayer([50 50 3])
    
    convolution2dLayer(2,8,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(2,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(2,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer];

%define path for the folder saving training progress
checkpointPath = 'U:\CV assignment\functions\computer_1';

%set training options
options = trainingOptions('sgdm', ...
'MaxEpochs',30,...
'InitialLearnRate',1e-3, ...
'ValidationData',imds_validation, ...
'ValidationFrequency',2, ...
'Verbose',false, ...
'Plots','training-progress',...
'Shuffle','every-epoch', ...
'ValidationPatience',20,...
'MiniBatchSize',150,...
'CheckpointPath',checkpointPath);

%train the network
trainedNet = trainNetwork(imds_training,layers,options);
