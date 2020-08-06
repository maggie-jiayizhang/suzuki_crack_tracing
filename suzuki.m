% Crack tracing problem

% read image
a = imread("a_edited.png");
%turn original image to black & white (bw)
t = graythresh(a);
a_bw = im2bw(a, t); 
%get the size of the original image
[height, width] = size(a_bw);
% uncomment to show the product of this stage.
% imshow(a_bw);


%%%%%%%%%%%%%%%%%%%%%%%%% Method 1 %%%%%%%%%%%%%%%%%%%%%%%%%
% first trace the signals (blobs); "skeletonize" the edge; generate path

% use Sobel's kernel to find the vertical edges in the image
% (we don't really care about the horizontal edges)
sx = fspecial("sobel");
sy = sx';
% set sx to zeros matrix -> ignore horizontal edges
sx = zeros(3, 3);
gx = imfilter(a_bw, sx, "replicate");
gy = imfilter(a_bw, sy, "replicate");
grad = sqrt(gx.*gx + gy.*gy); % grad = gradient
% uncomment to show the product of this stage.
% imshow(grad);

% "skeletonize" the traced image
grad_skel = bwmorph(grad, 'skel', Inf);

% % further denoise (optional)
% [L, n] = bwlabel(grad_skel, 8);
% % note: remove_by_area() is a custom function.
% f = remove_by_area(grad_skel, L, n, 8);

% run path finding algorithm on grad_skel
% first generate a scoring matrix score_skel
[score_skel, sr, sc] = score_path(grad_skel, 1, 0.2);

% for visualization of the scoring matrix
P_skel = mat2gray(score_skel);


% trace back with the scoring matrix to generate the best path.
[path_skel, count_skel] = generate_path(grad_skel, score_skel, sr, 1, 0.2);
[r_skel, c_skel] = find(path_skel==1);

[total, val] = size(r_skel);
percent1 = count_skel/total
%%%%%%%%%%%%%%%%%%%%%%%%% Method 1 ends %%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%% Method 2 %%%%%%%%%%%%%%%%%%%%%%%%%
% run generate path straight on a_bw
[score_bw, sr, sc] = score_path(a_bw, 1, 0.2);

% for visualization of the scoring matrix
P_bw = mat2gray(score_bw);

% trace back with the scoring matrix to generate the best path.
[path_bw, count_bw] = generate_path(a_bw, score_bw, sr, 1, 0.2);
[r_bw, c_bw] = find(path_bw==1);

[total, val] = size(r_bw);
percent2 = count_bw/total
%%%%%%%%%%%%%%%%%%%%%%%%% Method 2 ends %%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%% Visualization %%%%%%%%%%%%%%%%%%%%%%%%%
% visualize every image produced in the pipeline

% FIGURE 1 shows original images.
figure;
subplot(1,2,1);imshow(a);
title("Original image (bottom covered) from Suzuki 2020: a");
subplot(1,2,2);imshow(a_bw);
title("Black & white ver of the original image: a\_bw");

% FIGURE 2 shows the results of edge tracing + cleaning.
figure;
subplot(1,2,1);imshow(grad);
title("Annotations of vertical edges in a\_bw: grad");
subplot(1,2,2);imshow(grad_skel);
title("Denoised/skeletonized version of grad: grad\_skel");

% FIGURE 3 shows the visualization of scoring matrices.
figure;
title("Visualization of scores. Lighter pixel = higher score");
subplot(1,2,1);imshow(P_skel);
title("Visualization on grad\_skel (method 1)");
subplot(1,2,2);imshow(P_bw);
title("Visualization on a\_bw (method 2)");

% FIGURE 4 shows the final paths plotted on a_bw.
figure;
subplot(1,2,1);imshow(a_bw);
title(["Crack tracing on processed image, %signal=", percent1]);
hold on;
plot(c_skel, r_skel, 'b.', 'MarkerSize', 0.1);
subplot(1,2,2);imshow(a_bw);
title(["Crack tracing on original black & white image, %signal=", percent2]);
hold on;
plot(c_bw, r_bw, 'r.', 'MarkerSize', 0.1);