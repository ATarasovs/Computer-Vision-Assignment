%% get histogram values for R,G and B
function[rHist, gHist, bHist] = RGB_hist(sourceImages)

rHist=cell(1,length(sourceImages));
gHist=cell(1,length(sourceImages));
bHist=cell(1,length(sourceImages));

nBins=256;

     for k=1:length(sourceImages)
        I = sourceImages{k};
        rHist{k} = imhist(I(:,:,1), nBins);
        gHist{k} = imhist(I(:,:,2), nBins);
        bHist{k} = imhist(I(:,:,3), nBins);
     
%         rHist{k} 
%         gHist{k}
%         bHist{k}
        
       %mean_hist{k}=(sum(rHist{k})+sum(gHist{k})+sum(bHist{k}))/3;
     end
    
end

%% Summation of 256 bins for R,G and B, mean and SD


%% 