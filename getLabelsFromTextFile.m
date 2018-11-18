% This function creates the matrix of labels of images in the way
% path/title | class(label)

% Command to call the function - "labels = getLabelsFromTextFile();"

function[labels] = getLabelsFromTextFile()

    % Change this line if there is a different title!
    manmadeFile = fopen('Images/manmade_test.txt');
    manmadeLine = fgetl(manmadeFile);

    % Change this line if there is a different title!
    naturalFile = fopen('Images/natural_test.txt');
    naturalLine = fgetl(naturalFile);

    manmadeLabels = {};
    naturalLabels = {};

    while ischar(manmadeLine)
        manmadeLabels = [manmadeLabels, manmadeLine];
        manmadeLine = fgetl(manmadeFile);
    end

    while ischar(naturalLine)
        naturalLabels = [naturalLabels, naturalLine];
        naturalLine = fgetl(naturalFile);
    end
    % 
    fclose(manmadeFile);
    fclose(naturalFile);

    manmadeLabels = manmadeLabels';
    naturalLabels = naturalLabels';

    [manmadeRows, manmadeColumns] = size(manmadeLabels);
    [naturalRows, naturalColumns] = size(naturalLabels);


    for k=1:manmadeRows
        manmadeLabels{k,2} = 0;
    end

    for k=1:naturalRows
        naturalLabels{k,2} = 1;
    end

    labels = [manmadeLabels; naturalLabels];
end


    
