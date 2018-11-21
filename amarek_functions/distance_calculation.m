%https://uk.mathworks.com/matlabcentral/fileexchange/39275-histogram-distances
%use resized images for mean values
function[distance] = distance_calculation(meanRGB_man,meanRGB_nat,meanRGB_test)

meanRGB_source = [meanRGB_man;meanRGB_nat];
%distance = cell(1,length(resizedSourceImages));
for i = 1:length(meanRGB_test)
    for k = 1:length(meanRGB_source)
       distance(i,k) = mean(pdist2(meanRGB_source(k,:),meanRGB_test(i,:)));
    end
end
       
end

%distance = pdist2([mean_manmade_training;mean_natural_training],mean_test(1,:),'seuclidean')