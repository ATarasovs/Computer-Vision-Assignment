%test_imgs = getSourceImages('U:\CV assignment\Images\fewimg','jpg');
%https://uk.mathworks.com/help/images/detect-lines-using-the-radon-transform.html
%http://web.ipac.caltech.edu/staff/fmasci/home/astro_refs/HoughTrans_lines_09.pdf
%https://uk.mathworks.com/help/images/hough-transform.html

function [gray_pics] = edge_det(sourceImages)

gray_pics=cell(1,length(sourceImages));
    for k = 1:length(sourceImages)
        I = sourceImages{k};
       gray_pics{k} = rgb2gray(I);
    end
    
 edge_pics=cell(1,length(gray_pics));  
    for k = 1:length(gray_pics)
        I = gray_pics{k};
        edge_pics{k} = edge(I,'canny',[0.0001 0.15]); %threshold->what is excluded
    end
    imshow(edge_pics{7})
end

  