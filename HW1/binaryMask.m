%--------------------------------------------%
% Homework Group 11: Rohit Kharat and Reid Glaze
% Course Code: CSCI 5722
% Homework 1: Task 8
% Instructor: Prof. Ioana Fleming
%--------------------------------------------%

function [outImg] = binaryMask(inImg)

tic

% Read image
inputImage = imread(inImg);

[row, col, ch] = size(inputImage);

if ch == 3
    [inputImage] = luminance_NL(inputImage);
end

% Coverting image array from 'uint8' to 'double' to preserve precision
inputImage = double(inputImage);

% Sum of all the pixels - through loops
%sum_pixel = 0;
%for i=1:row
%    for j=1:col
%        sum_pixel = sum_pixel + inputImage(i, j);
%    end
%end

% Sum of all the pixels - through 'sum' function
sum_pixel = sum(inputImage, "all");

% Calculating threshold to separate backgrounf from object of interest
threshold = sum_pixel/(row*col);

outImg = zeros(row, col);

% Binarizing each pixel - through loops
%for i=1:row
%    for j=1:col
%        if inputImage(i, j) >= threshold
%            outImg(i, j) = 0;
%        else
%            outImg(i, j)=1;
%        end
%    end
%end

% Binarizing each pixel - through logical operations
outImg(inputImage > threshold) = 0;
outImg(inputImage < threshold) = 1;

% Plots
subplot(1,2,1), imshow(inImg);
subplot(1,2,2), imshow(outImg);

toc

% Save iamge
imwrite(outImg,'/Users/rohitkharat/Downloads/CV/newimage_binaryMask.jpg')

end

function [ outImg ] = luminance_NL( inImg )

outImg = inImg;

[rows, columns, ~] = size(outImg);

% Separate RGB channel
red_channel = outImg(:, :, 1);
green_channel = outImg(:, :, 2);
blue_channel = outImg(:, :, 3);

% Weighting system
I = 0.299*red_channel + 0.587*green_channel + 0.114*blue_channel;

outImg = I;

end

