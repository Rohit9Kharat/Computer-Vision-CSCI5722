%--------------------------------------------%
% Homework Group 11: Rohit Kharat and Reid Glaze
% Course Code: CSCI 5722
% Homework 2: Compute H
% Instructor: Prof. Ioana Fleming
%--------------------------------------------%

function [new_min, H_min] = computeH()

% Loading the saved coordinates matrix
coord_mat = load("coord_1.mat");

siz = size(coord_mat.coord_mat(:,1));
M = zeros(4 ,4);

avg_proj_err_arr = inf(1,20);
prev_min = -inf;
new_min = inf;

% Loop for 20 iterations
for iter = 1:20
    % Randomly selecting 4 correspondence points
    n = randperm(10,4);
    siz_n = size(n);
    %M = zeros(siz_n(2), 4);

    for i = 1:siz_n(2)
        M(i, :) = coord_mat.coord_mat(n(i), :);
    end

    % Source and destination x and y coordinates
    x_s = M(:,1);
    y_s = M(:,2);
    x_d = M(:,3);
    y_d = M(:,4);

    A = zeros(2*siz_n(2),9);

    % Computing A where A*H = 0
    for i = 1:siz_n(2)

        A(2*i-1, :) = [x_s(i), y_s(i), 1, 0, 0, 0, -x_d(i)*x_s(i), -x_d(i)*y_s(i), -x_d(i)];
        A(2*i, :) = [0, 0, 0, x_s(i), y_s(i), 1, -y_d(i)*x_s(i), -y_d(i)*y_s(i), -y_d(i)];

    end

    % Singular Value Decomposition
    [U, S, V] = svd(A);

    %if V(:, 9) 
    H = V(:, 9); 
    H = H/norm(H);
    H = reshape(H, 3, 3)';

    % Getting projection coordinates using homography matrix
    source_coord = cat(1, coord_mat.coord_mat(:, 1:2)', ones(1, siz(1)));
    %source_coord = cat(1, coord_mat.coord_mat(:, 3:4)', ones(1, siz(1)));
    proj_coord = H * source_coord;

    % Dividing the 3rd value to get new coordinates
    for i = 1:siz(1)
        proj_coord(:,i) = proj_coord(:,i)/proj_coord(3,i);
    end
    
    % Calculation of average projection error: by euclidean distance
    proj_coord = proj_coord(1:2,:);
    %exp_coord = coord_mat.coord_mat(:, 1:2)';
    exp_coord = coord_mat.coord_mat(:, 3:4)';
    dist_coord = sqrt((exp_coord(1,:)-proj_coord(1,:)).^2 + (exp_coord(2,:)-proj_coord(2,:)).^2);
    prev_min = mean(dist_coord);

    if new_min > prev_min
        new_min = prev_min;
        H_min = H;
    end

    avg_proj_err_arr(1, iter) = prev_min;

    % Saving the matrix variable for future use
    filename = 'H_min.mat';
    save(filename, 'H_min');

end

end
