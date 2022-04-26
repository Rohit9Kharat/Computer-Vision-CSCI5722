%--------------------------------------------%
% Rohit Kharat and Reid Glaze
% Course Code: CSCI 5722
% Homework 5: Task 7: GrabCat
% Instructor: Prof. Ioana Fleming
%--------------------------------------------%

% Read the input images. 
objImg = imread('../imgs/dog2.jpeg');
backgroundImg = imread('../imgs/backgrounds/earth.jpg');

% Parameters for clustering
k = 5;
clusteringMethod = 'kmeans';

% Function handle
featureHandle = @ComputeColorFeatures;

% Normalization
normFeat = true;

% Image resizing
resize = 0.9
;

% Calling segmentation function
objSegment = ComputeSegmentation(objImg, k, clusteringMethod, featureHandle, ...
                               normFeat, resize);

% Calling ChooseSegments function
[~, outImg] = ChooseSegments(objSegment, backgroundImg);
imshow(outImg);

% Save the composite image.
folder='Output Images/';
imwrite(compositeImage, fullfile(folder,'grabcat_output.jpg'));