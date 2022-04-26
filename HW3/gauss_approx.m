%--------------------------------------------%
% Rohit Kharat
% Course Code: CSCI 5722
% Homework 3: Q5
% Instructor: Prof. Ioana Fleming
%--------------------------------------------%

function [avgFil2, sigma_ach] = gauss_approx(n, sigma, inImg)

% Determination of w_ideal and hence w_l and w_u
w_ideal = sqrt( (12*sigma^2)/n + 1 );
w_ideal = round(w_ideal);

if mod(w_ideal, 2) == 0 %even
    w_l = w_ideal - 1;
    w_u = w_l + 2;
elseif mod(w_ideal, 2) == 1 %odd
    w_l = w_ideal - 2;
    w_u = w_l + 2;
end

% Determination of m (passes)
m = (12*sigma^2 - n*w_l^2 - 4*n*w_l - 3*n)/(-4*w_l - 4);
m = round(m);

% Applying averaging filter of widht w_l, m times
avgFil1 = imread(inImg);
for i = 1:m
    [ avgFil1 ] = meanFilter(avgFil1, w_l);
end

imwrite(uint8(avgFil1),'/Users/rohitkharat/Downloads/CV/HW3/avgFil1.jpg');

% Applying averaging filter of widht w_u, (n-m) times
avgFil2 = avgFil1;
for i = 1:(n-m)
    [ avgFil2 ] = meanFilter(avgFil2, w_u);
end

% Standard Deviation achieved using averaging

sigma_ach = sqrt((m*w_l^2 + (n-m)*w_u^2 - 2)/12);

% Plots
subplot(1,2,1), imshow(inImg);
subplot(1,2,2), imshow(uint8(avgFil2));


end