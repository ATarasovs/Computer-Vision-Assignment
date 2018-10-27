function[tilesAcross, tilesDown] = getTileDimensions(I, tilesNum, tilesSize)
   [height, width, dim] = size(I);
   tilesAcross = round(width/tilesSize);
   tilesDown = round(height/tilesSize);
end


