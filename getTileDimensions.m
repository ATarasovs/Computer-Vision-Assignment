function[tilesAcross, tilesDown] = getTileDimensions(I, tilesNum, tilesSize)
   [height, width, dim] = size(I);
   tilesAcross = floor(width/tilesSize);
   tilesDown = floor(height/tilesSize);
end


