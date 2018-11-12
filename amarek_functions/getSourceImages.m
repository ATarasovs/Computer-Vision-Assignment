function[sourceImages] = getSourceImages(directory, fileType)
    sourceImagesList = dir([directory '/*.' fileType]);

    sourceImages = {};
    for k = 1:length(sourceImagesList)
        sourceImages{k} = imread([directory '/' sourceImagesList(k).name]);
    end
end

%directory='U:\CV assignment\Images\manmade_training';
%fileType = 'jpg';
%Images = getImages(directory, fileType);