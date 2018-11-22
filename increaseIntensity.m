% Increase saturation by 20%

function[mosaicImageInc] = increaseIntensity(mosaicImage)
    HSV = rgb2hsv(mosaicImage);
    HSV(:, :, 2) = HSV(:, :, 2) * 1.20;
    HSV(HSV > 1) = 1;
    mosaicImageInc = hsv2rgb(HSV);
end