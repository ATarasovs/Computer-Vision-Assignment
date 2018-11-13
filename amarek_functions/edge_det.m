%test_imgs = getSourceImages('U:\CV assignment\Images\fewimg','jpg');
%https://uk.mathworks.com/help/images/detect-lines-using-the-radon-transform.html
%http://web.ipac.caltech.edu/staff/fmasci/home/astro_refs/HoughTrans_lines_09.pdf
%https://uk.mathworks.com/help/images/hough-transform.html

function [peaks] = edge_det(sourceImages)

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
  
     %H=double(1,length(gray_pics));  
%     for k = 1:length(edge_pics)
%         I = gray_pics{k};
%         [H{k},theta{k},rho{k}] = hough(I);
%     end
    
    for k = 1:length(edge_pics)
        I = edge_pics{k};
        [H{k},theta{k},rho{k}] = hough(I);
        peaks(k) = length(houghpeaks(H{k},10000,'Threshold',1));
    end
    
end

%peaks(k) = length(houghpeaks(H{k},10000,'Threshold',1)); 64%
%peaks(k) = length(houghpeaks(H{k},10000,'Threshold',10)); 62%
  %lines = houghlines(gray_pics{1},theta{1},rho{1},peaks,'FillGap',5,'MinLength',7)