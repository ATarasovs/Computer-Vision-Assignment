function[mean] = getMeanSource(sourceImages)
    for k=1:length(sourceImages)
        I = sourceImages{k};
        [mean(k,1), mean(k,2), mean(k,3)] = getMeanRGB(I);
    end
end