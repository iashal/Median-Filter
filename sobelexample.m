close all;
clear all;
clc;

imshow('cat1.jpg');
figure
im=imread('cat1.jpg');
sbl=sobelfunction(im);
imgr=rgb2gray(im);






kernelx = [ -1, 0, 1;
            -2, 0, 2;
            -1, 0, 1];

kernely = [  -1,-2,-1;
             0, 0, 0;
            1, 2, 1];
        
imd=im2double(imgr);
[m,n]=size(imgr);
padded=zeros(m+2,n+2);
padded(2:m+1,2:n+1)=imd;
[m,n]=size(imd);

for j=2:n
    for i=2:m
        out=[padded(i-1,j-1),padded(i-1,j),padded(i-1,j+1);
            padded(i,j-1),padded(i,j),padded(i,j+1);
            padded(i+1,j-1),padded(i+1,j),padded(i+1,j+1)];
        outim=kernely.*out;
        S=sum(sum(outim),2);
        sbly(i,j)=S;
    end
end

imshow(sbly);
title('sobelY')
figure

for i=2:m
    for j=2:n
        out=[padded(i-1,j-1),padded(i-1,j),padded(i-1,j+1);
            padded(i,j-1),padded(i,j),padded(i,j+1);
            padded(i+1,j-1),padded(i+1,j),padded(i+1,j+1)];
        outim=kernelx.*out;
        S=sum(sum(outim),2);
        sblx(i,j)=S;
    end
end

imshow(sblx);
title('sobelX')
figure


for c=1:i
    for d=1:j
       sbl(c,d)=sqrt(sblx(c,d).^2 +sbly(c,d).^2); 
    end
end

imshow(sbl);
title('sobel')
figure