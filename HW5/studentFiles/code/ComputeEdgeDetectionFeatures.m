%--------------------------------------------%
% Rohit Kharat and Reid Glaze
% Course Code: CSCI 5722
% Homework 5: ComputeEdgeDetectionFeatures Function
% Instructor: Prof. Ioana Fleming
%--------------------------------------------%

function featImage = ComputeEdgeDetectionFeatures(image)
    
    %image = imread(image);
    % Converting to rgb to gray
    grayImage = im2gray(image);
    
    % Calculating the height & width of the image
    hgtImage = size(image,1);
    wdtImage = size(image,2);
    
    % Initialization of feature space
    featImage = zeros([hgtImage,wdtImage,1]);

    % Canny edge detection
    featImage(:,:,1) = edge(grayImage,'canny');
%     featImage(:,:,2) = edge(grayImage,'canny');
%     featImage(:,:,3) = edge(grayImage,'canny');

    %imshow(featImage);

end