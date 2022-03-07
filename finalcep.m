close all;
clear all;
clc;

imshow('cat1.jpg');
figure
im=imread('cat1.jpg');
sbl=sobelfunction(im);
imgr=rgb2gray(im);
imshow(imgr);
title('Gray Image')
figure
imd=im2double(imgr);
noisy=imnoise(imd,'speckle');
imshow(noisy);
title('Noisy Image')
figure
[m,n]=size(noisy);
padded=zeros(m+2,n+2);
padded(2:m+1,2:n+1)=noisy;
imshow(sbl);
title('Edge Detection')
figure
for i=2:m
    for j=2:n
 
        out=[padded(i-1,j-1),padded(i-1,j),padded(i-1,j+1),padded(i,j-1),padded(i,j),padded(i,j+1),padded(i+1,j-1),padded(i+1,j),padded(i+1,j+1)];
        o=sort(out);
        outim(i,j)=o(1,5);
        
    end
end
for i=2:m
    for j=2:n
        if sbl(i,j)>=1
            outimg(i,j)=imd(i,j);
        else    
        out=[padded(i-1,j-1),padded(i-1,j),padded(i-1,j+1),padded(i,j-1),padded(i,j),padded(i,j+1),padded(i+1,j-1),padded(i+1,j),padded(i+1,j+1)];
        o=sort(out);
        outimg(i,j)=o(1,5);
        end
    end
end




imshow(outim);
title('Median filter Image');
figure;
imshow(outimg);
title('Median filter Image with Edge preserving');
figure;