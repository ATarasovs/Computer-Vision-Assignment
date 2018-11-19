function[mosaicImageInc] = increaseIntensity(mosaicImage)

    % Increase color intensity for 20%
    HSV = rgb2hsv(mosaicImage);
    HSV(:, :, 2) = HSV(:, :, 2) * 1.20;
    HSV(HSV > 1) = 1;  % Limit values
    mosaicImageInc = hsv2rgb(HSV);
end