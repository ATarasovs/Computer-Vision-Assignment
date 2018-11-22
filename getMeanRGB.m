function[redMean, greenMean, blueMean] = getMeanRGB(I)

    [height, width, dim] = size(I);
    imgArea = height * width;
    [redMean, greenMean, blueMean] = deal(0);
    for k=1:height
        for j=1:width
            redMean = redMean + double(I(k,j,1));
            greenMean = greenMean + double(I(k,j,2));
            blueMean = blueMean + double(I(k,j,3));
        end
    end
    
    redMean = round(redMean/imgArea);
    greenMean = round(greenMean/imgArea);
    blueMean = round(blueMean/imgArea);
end

