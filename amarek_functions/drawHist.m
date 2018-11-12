%% get histogram values for R,G and B
function[rHist2, gHist2, bHist2] = drawHist(rHist, gHist, bHist)
%     rHist2 = 0
%     gHist2 = 0
%     bHist2 = 0
%     rHist2=cell();
%     gHist2=cell();
%     bHist1=cell();

    rHist2 = rHist{1};
    gHist2 = gHist{1};
    bHist2 = bHist{1};
    
    for k = 2:length(rHist)
       rHist2 = rHist2 + rHist{k};
       gHist2 = gHist2 + gHist{k};
       bHist2 = bHist2 + bHist{k};
    end
    
end