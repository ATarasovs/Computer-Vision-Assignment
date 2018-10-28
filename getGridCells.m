% Needs imrovement as, for example, if we specify the number of tiles - 30,
% it will be 6 x 4 = 24
function[gridCells] = getGridCells(I, tileSize, across, down)
    for k=1:down
        for j=1:across
            row = round((1+(k-1)*tileSize):(k*tileSize));
            column = round((1+(j-1)*tileSize):(j*tileSize));
            gridCells{k,j} = I(row,column,1:3);
        end
    end
end

