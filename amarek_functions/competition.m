tic
% imds_test=imageDatastore({'U:\CV assignment\Images\manmade_test','U:\CV assignment\Images\natural_test'});
% imds_test.Labels=categorical(labels_test');
% imds_test.ReadSize=numpartitions(imds_test);
% imds_test.ReadFcn = @(loc)imresize(imread(loc),[50,50]);

%predict labels using previosuly trained convolutional neural network
predict_labels = classify(trainedNet_90,imds_test);
% labels_test = labelsfromJianguo;

accuracy = sum(predict_labels == labels_test)/numel(labels_test);

toc

% labels_test0(1:250,1)=0;
% labels_test0(251:500,1)=1;


% labels_test=labels_test'
% labels_test=categorical(labels_test)