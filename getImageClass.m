function[sourcePath] = getImageClass(targetImage)
    clc
    load('competition_all.mat');
    trained_net = trainedNet_91_on_all;
    imds_test = imageDatastore({targetImage});
    imds_test.ReadSize = numpartitions(imds_test);
    imds_test.ReadFcn = @(loc)imresize(imread(loc),[50,50]);
    imageClass = classify(trained_net,imds_test);
    
    imageClass = str2double(cellstr(imageClass));
    
    if imageClass == 0
        sourcePath = 'Images/manmade_training';
    elseif imageClass == 1
        sourcePath = 'Images/natural_training';
    end
end
