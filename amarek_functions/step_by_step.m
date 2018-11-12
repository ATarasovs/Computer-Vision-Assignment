clc
clear

manmade_training = getSourceImages('U:\CV assignment\Images\fewimg','jpg');
natural_training = getSourceImages('U:\CV assignment\Images\fewimg','jpg');

resized_manmade_training = resizeSourceImages(manmade_training);
resized_natural_training = resizeSourceImages(natural_training);

[rHistNat, gHistNat, bHistNat] = RGB_hist(resized_manmade_training);
[rHistMan, gHistMan, bHistMan] = RGB_hist(resized_natural_training);

[rHist2Nat, gHist2Nat, bHist2Nat] = drawHist(rHistNat, gHistNat, bHistNat);
[rHist2Man, gHist2Man, bHist2Man] = drawHist(rHistMan, gHistMan, bHistMan);

RGB_hist_comparison