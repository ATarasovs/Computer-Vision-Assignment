clc
clear

manmade_training = getSourceImages('U:\CV assignment\Images\manmade_training','jpg');
natural_training = getSourceImages('U:\CV assignment\Images\natural_training','jpg');
manmade_test = getSourceImages('U:\CV assignment\Images\manmade_test','jpg');
natural_test = getSourceImages('U:\CV assignment\Images\natural_test','jpg');

resized_manmade_training = resizeSourceImages(manmade_training);
resized_natural_training = resizeSourceImages(natural_training);
resized_manmade_test = resizeSourceImages(manmade_test);
resized_natural_test = resizeSourceImages(natural_test);

% [rHistNat, gHistNat, bHistNat] = RGB_hist(resized_manmade_training);
% [rHistMan, gHistMan, bHistMan] = RGB_hist(resized_natural_training);
% [rHistTest, gHistTest, bHistTest] = RGB_hist(resized_test);

mean_manmade = getMeanSource(resized_manmade_training);
mean_natural = getMeanSource(resized_natural_training);
mean_manmade_test = getMeanSource(resized_manmade_test);
mean_natural_test = getMeanSource(resized_natural_test);

[peaks_manmade_training] = (edge_det(resized_manmade_training))';
[peaks_natural_training] = (edge_det(resized_natural_training))';
[peaks_manmade_test] = (edge_det(resized_manmade_test))
[peaks_natural_test] = (edge_det(resized_natural_test))';

[feature_matrix,labels] = get_feature_matrix(peaks_manmade_training,peaks_natural_training,mean_manmade,mean_natural);
[test_feature_matrix,test_labels] = get_test_feature_matrix(peaks_manmade_test,peaks_natural_test,mean_manmade_test,mean_natural_test);

[knn_labels,confusion_matrix] = knn_classifier(feature_matrix,labels,test_feature_matrix,test_labels);
score = (confusion_matrix(1,1)+confusion_matrix(2,2))/(confusion_matrix(1,2)+confusion_matrix(2,1)+confusion_matrix(1,1)+confusion_matrix(2,2));

% [feature_matrix,labels,test_feature_matrix,test_labels] = get_feature_matrix(mean_manmade,mean_natural,mean_manmade_test,me_natural_test);
% [knn_labels,confusion_matrix] = knn_classifier(feature_matrix,labels,test_feature_matrix,test_labels);

%mean_distance = distance_hist([mean_manmade;mean_natural],mean_test);
