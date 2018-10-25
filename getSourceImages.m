function[sourceImages] = getSourceImages(directory, fileType)
    sourceImagesList = dir([directory '/*.' fileType]);

    sourceImages = {};
    for k = 1:length(sourceImagesList)
        sourceImages{k} = imread([directory '/' sourceImagesList(k).name]);
    end
end
