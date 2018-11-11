function[resizedTargetImage] = resizeTargetImage(I, targetImageWidth, targetImageHeight) 
    width = str2num(targetImageWidth);
    height = str2num(targetImageHeight);
    resizedTargetImage = imresize(I, [height width]);
end