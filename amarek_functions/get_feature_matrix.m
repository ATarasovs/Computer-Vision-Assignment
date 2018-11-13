function [feature_matrix,labels] = get_feature_matrix(feature_manmade,feature_natural,feature_manmade2,feature_natural2)

%feature_matrix=[];
feature_matrix(1:500,1)=feature_manmade;
feature_matrix(501:1000,1)=feature_natural;

feature_matrix(1:500,2:4)=feature_manmade2;
feature_matrix(501:1000,2:4)=feature_natural2;

labels(1:500,1)=0;
labels(501:1000,1)=1;

% test_feature_matrix(1:5,4)=test_feature_manmade{1:5};
% test_feature_matrix(6:10,4)=test_feature_natural{1:5};
% 
% test_labels(1:5,1)=0;
% test_labels(6:10,1)=1;

end

%call with: [feature_matrix,labels,test_feature_matrix,test_labels] = get_feature_matrix(mean_manmade,mean_natural,mean_manmade_test,mean_natural_test)