
function[resizedSourceImages] = resizeSourceImages(sourceImages)

    for k = 1:length(sourceImages)
        I = sourceImages{k};
        resizedSourceImages{k} = imresize(I, [200 200]);
    end
    
end