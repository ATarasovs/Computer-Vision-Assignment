
function [peaks] = knn_edge_det(sourceImages)

gray_pics=cell(1,length(sourceImages));
    for k = 1:length(sourceImages)
        I = sourceImages{k};
       gray_pics{k} = rgb2gray(I);
    end
    
 edge_pics=cell(1,length(gray_pics));  
    for k = 1:length(gray_pics)
        I = gray_pics{k};
        edge_pics{k} = edge(I,'canny',[0.2 0.3]); %threshold->what is excluded,[0.2 0.3]
    end


    for k = 1:length(edge_pics)
        I = edge_pics{k};
        [H{k},theta{k},rho{k}] = hough(I);
        peaks(k) = length(houghpeaks(H{k},10000,'Threshold',1));
    end
    
end