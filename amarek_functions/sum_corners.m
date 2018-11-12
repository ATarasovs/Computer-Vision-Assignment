function[nr_of_c] = sum_corners(corner_coordinates)

    nr_of_c = length(corner_coordinates{1});
    
    for k = 2:length(corner_coordinates)
       nr_of_c = nr_of_c + length(corner_coordinates{k});
    end
    
end