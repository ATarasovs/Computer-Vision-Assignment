function[accuracy] = competition(trained_net, test_img_path, test_img_path2)
    tic
    
    %Remove after
    labels_test(1:250,1) = 0;
    labels_test(251:500,1) = 1;
    
    imds_test = imageDatastore({test_img_path,test_img_path2});
    imds_test.Labels=categorical(labels_test);
    imds_test.ReadSize=numpartitions(imds_test);
    imds_test.ReadFcn = @(loc)imresize(imread(loc),[50,50]);

    %predict labels using previosuly trained convolutional neural network
    predict_labels = classify(trained_net,imds_test);

    %get labels for test images for checking the accuracy
    labels_test = getLabelsFromTextFile();
    labels_double = cell2mat(labels_test(:,2));
    labels_test_categorical = categorical(labels_double);

    %check accuracy
    accuracy = sum(predict_labels == imds_test.Labels)/numel(imds_test.Labels);

    toc

    %results = [labels_test, cellstr(predict_labels)];

    % labels_test0(1:250,1)=0;
    % labels_test0(251:500,1)=1;
end


