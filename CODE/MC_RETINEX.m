clc;
clear all;
close all;

img_rgb = imread('raw-890/383_img_.png');

%RBG TO HSV
img_hsv = rgb2hsv(img_rgb);

figure(1)
subplot(1,2,1);
imshow(img_rgb);

subplot(1,2,2);
imshow(img_hsv);



