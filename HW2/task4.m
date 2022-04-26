%--------------------------------------------%
% Homework Group 11: Rohit Kharat and Reid Glaze
% Course Code: CSCI 5722
% Homework 2: Script
% Instructor: Prof. Ioana Fleming
%--------------------------------------------%

% Reading images
% Image1 = imread('Square0.jpeg');
% Image2 = imread('Square1.jpeg');

% Applying the functions
[coord_mat] = getPoints('Square0.jpeg', 'Square1.jpeg');
[H_min] = computeH();
[mos_img] = warp1('Square1.jpeg', 'Square1.jpeg');

% Plotting images
subplot(1,3,1);
imshow(uint8('Square0.jpeg'));

subplot(1,3,2);
imshow(uint8('Square1.jpeg'));

subplot(1,3,3);
imshow(uint8(mos_img));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Reading sample images
% sampImage1 = imread('IMG_8257.HEIC');
% sampImage2 = imread('IMG_8258.HEIC');

% Applying the functions
[coord_mat] = getPoints('IMG_8257.HEIC', 'IMG_8258.HEIC');
[H_min] = computeH();
[mos_img] = warp1('IMG_8257.HEIC', 'IMG_8258.HEIC');

% Plotting images
subplot(1,3,1);
imshow(uint8('IMG_8257.HEIC'));

subplot(1,3,2);
imshow(uint8('IMG_8258.HEIC'));

subplot(1,3,3);
imshow(uint8(mos_img));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Applying the functions
[coord_mat] = getPoints('IMG_8259.HEIC', 'IMG_8260.HEIC');
[H_min] = computeH();
[mos_img] = warp1('IMG_8259.HEIC', 'IMG_8260.HEIC');

% Plotting images
subplot(1,3,1);
imshow(uint8('IMG_8259.HEIC'));

subplot(1,3,2);
imshow(uint8('IMG_8260.HEIC'));

subplot(1,3,3);
imshow(uint8(mos_img));