close all;
I = imread('me.jpg');
I = imresize(I,0.15);
I = im2double(I);
R = I(:,:,1); R = R(:);
G = I(:,:,2); G = G(:);
B = I(:,:,3); B = B(:);

disp('kmeans clustering');
k = 4;
[idx, C, SUMD, D]= kmeans([R G B], k);
colors = zeros(size(unique(idx)));

I_kmeans = ind2rgb(reshape(idx, size(I,1), size(I, 2)), C);

disp('DBSCAN clustering');
e = 100;
minPts = 100;
% [idx, isnoise] = DBSCAN([R G B], 0.5, 10);
I_DBSCAN = ind2rgb(reshape(idx, size(I,1), size(I, 2)), [1 0 0; 0 1 0; 0 0 1; 1 1 0; 1 0 1; 0 1 1; 1 1 1; 0 0 0]);

disp('MeanShift clustering');
bw   = 0.2;
[I_Meanshift, Nms]   = Ms(I,bw);                    % Mean Shift (color)
%[Ims2, Nms2] = Ms2(I,bw);                   % Mean Shift (color + spatial)

subplot(221); imshow(I); title('Original'); 
subplot(222); imshow(I_kmeans); title(strcat('Kmeans:', num2str(k)));
subplot(223); imshow(I_DBSCAN); title(strcat('DBSCAN, e=', num2str(e), ' MinPts:',num2str(minPts)));
subplot(224); imshow(I_Meanshift); title('Mean shift');