function[accuracy] = competition(trained_net, test_img_path)
    tic
    %Remove after
    test_img_path2 = 'U:\CV assignment\Images\manmade_test';
    imds_test=imageDatastore({test_img_path2,test_img_path});
    % imds_test.Labels=categorical(labels_test');
    imds_test.ReadSize=numpartitions(imds_test);
    imds_test.ReadFcn = @(loc)imresize(imread(loc),[50,50]);

    %predict labels using previosuly trained convolutional neural network
    predict_labels = classify(trained_net,imds_test);

    %get labels for test images for checking the accuracy
    labels_test = getLabelsFromTextFile();
    labels_double=cell2mat(labels_test(:,2));
    labels_test_categorical=categorical(labels_double);

    %check accuracy
    accuracy = sum(predict_labels == labels_test_categorical)/numel(labels_test_categorical);

    toc

    %results = [labels_test, cellstr(predict_labels)];

    % labels_test0(1:250,1)=0;
    % labels_test0(251:500,1)=1;
end


% labels_test=labels_test'
% labels_test=categorical(labels_test)