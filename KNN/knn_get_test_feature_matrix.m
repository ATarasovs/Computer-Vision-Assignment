function [test_feature_matrix,test_labels] = get_test_feature_matrix(feature_manmade,feature_natural,feature_manmade2,feature_natural2)

%feature_matrix=[];
test_feature_matrix(1:250,1)=feature_manmade;
test_feature_matrix(251:500,1)=feature_natural;

test_feature_matrix(1:250,2:4)=feature_manmade2;
test_feature_matrix(251:500,2:4)=feature_natural2;

test_labels(1:250,1)=0;
test_labels(251:500,1)=1;

% test_feature_matrix(1:5,4)=test_feature_manmade{1:5};
% test_feature_matrix(6:10,4)=test_feature_natural{1:5};
% 
% test_labels(1:5,1)=0;
% test_labels(6:10,1)=1;

end