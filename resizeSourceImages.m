function[resizedSourceImages] = resizeSourceImages(sourceImages)
% Probably this functio needs some improvements as nows the image is simply
% resized and not cropped. "What if the image will have a size of 300x50"
    for k=1:length(sourceImages)
        I = sourceImages{k};
        [height, width, dim] = size(I);
        iSize = 50; 
        
        if height <= width
            resizedSourceImages{k} = imresize(I, [iSize iSize]);
        elseif height > width
            resizedSourceImages{k} = imresize(I, [iSize iSize]);
        end
    end
end