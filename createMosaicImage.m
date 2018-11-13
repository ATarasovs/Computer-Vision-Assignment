function[newImage] = createMosaicImage(resizedSourceImages, selectedSourceImages)
    [height, width] = size(selectedSourceImages);
    
    for k=1:height
        for j=1:width
            newImage{k,j} = resizedSourceImages{selectedSourceImages(k,j)};
        end
    end
    
    newImage = cell2mat(newImage);
end