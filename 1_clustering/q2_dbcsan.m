close all;
I = imread('me.jpg');
I = imresize(I,0.1)
k = 4;
%I(:,:,1)=0;
%I(:,:,2)=0;
%I(:,:,3)=0;
imshow(I);

I = im2double(I);
%HSV = rgb2hsv(I);
%H = HSV(:,:,1); H = H(:);
%S = HSV(:,:,2); S = S(:);
%V = HSV(:,:,3); V = V(:);

R = I(:,:,1); R = R(:);
G = I(:,:,2); G = G(:);
B = I(:,:,3); B = B(:);
%[idx, C, SUMD, D]= kmeans([R G B], k);

DBSCAN([R G B], 0.5, 10)
%imshow(ind2rgb(reshape(idx, size(I,1), size(I, 2)), [1 0 0; 0 1 0; 0 0 1; 1 1 0; 1 0 1; 0 1 1; 1 1 1; 0 0 0]))


%imshow(reshape(idx, size(I,1), size(I, 2)))