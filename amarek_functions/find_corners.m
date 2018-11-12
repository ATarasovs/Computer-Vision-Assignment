function [corner_coordinates] = find_corners(sourceImages)

[resizedSourceImages] = resizeSourceImages(sourceImages);

gray_pics = cell(1,length(resizedSourceImages));
    for k = 1:length(resizedSourceImages)
        I = resizedSourceImages{k};
       gray_pics{k} = rgb2gray(I);
    end
       
   for k = 1:length(gray_pics)
       I=gray_pics{k};
       corner_coordinates{k} = corner(I,'Harris', 20000);
   end
end


% imshow(I)
% hold on
% plot(C(:,1),C(:,2),'r*');