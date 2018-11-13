%https://uk.mathworks.com/help/stats[/classification-using-nearest-neighbors.html#bsehyl7-1
function [knn_labels,confusion_matrix] = knn_classifier(feature_matrix,labels,test_feature_matrix,test_labels)

X=feature_matrix;
Y=labels;
mdl = fitcknn(X,Y,'NumNeighbors',15);

T=test_feature_matrix;
knn_labels = predict(mdl,T);

confusion_matrix = confusionmat(test_labels,knn_labels);
end

%accuracy =
%(confusion_matrix(1,1)+confusion_matrix(2,2))/(confusion_matrix(1,2)+confusion_matrix(2,1)+confusion_matrix(1,1)+confusion_matrix(2,2))
%,'NumNeighbors',15