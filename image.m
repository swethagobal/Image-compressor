close all;
clear all;
f1= @(block_struct) dct2(block_struct.data);
f2= @(block_struct) idct2(block_struct.data);
Im=imread("ic.m");
imwrite(Im,'new.jpg');
%imrgb2gray(I)
figure,imshow(Im);
J= blockproc(Im,[8 8],f1);
depth = find(abs(J) < 150);
J(depth) = zeros(size(depth));
K= blockproc(J,[8 8],f2)/255;
figure,imshow(K);
K
imwrite(k,'newc.tif');
compression_ratio = nume1(J)/nume1(depth)