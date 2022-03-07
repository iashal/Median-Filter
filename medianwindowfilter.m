close all;
clear all;
clc;

im=imread('cat.jpg');
imgr=rgb2gray(im);
imshow(imgr);
title('Gray Image')
figure
imd=im2double(imgr);
noisy=imnoise(imd,'salt & pepper');
imshow(noisy);
title('Noisy Image')
figure
[m,n]=size(noisy);
padded=zeros(m+2,n+2);
padded(2:m+1,2:n+1)=noisy;
for i=2:m
    for j=2:n
        out=[padded(i-1,j-1),padded(i-1,j),padded(i-1,j+1),padded(i,j-1),padded(i,j),padded(i,j+1),padded(i+1,j-1),padded(i+1,j),padded(i+1,j+1)];
        o=sort(out);
        outimg(i,j)=o(1,5);
    end
end




imshow(outimg);
title('Median filter Image');
figure;


