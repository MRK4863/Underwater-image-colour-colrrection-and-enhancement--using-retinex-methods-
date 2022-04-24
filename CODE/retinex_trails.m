clc;
clear all;
close all;

img = imread('raw-890/129_img_.png');
img = double(img);
% img = im2double(img);
%img_hsv = rgb2hsv(img);

% figure;
% imshow(img);
% 
% figure;
% subplot(2,1,1);
% imshow(img_hsv(:,:,3));
% 
% subplot(2,1,2);
% imshow(rgb2gray(img));
% 
retinex_R = retinex_mccann99((img(:,:,1)),4);
retinex_G = retinex_mccann99((img(:,:,2)),4);
retinex_B = retinex_mccann99((img(:,:,3)),4);

retinex_R(isnan(retinex_R))=0;
retinex_G(isnan(retinex_G))=0;
retinex_B(isnan(retinex_B))=0;

% retinex_R = 10.^retinex_R;
% retinex_G = 10.^retinex_G;
% retinex_B = 10.^retinex_B;

disp(max(retinex_R(:)));
disp(max(retinex_G(:)));
disp(max(retinex_B(:)));

retinex_R = uint8(retinex_R);
retinex_G = uint8(retinex_G);
retinex_B = uint8(retinex_B);


figure;
subplot(1,3,1);
plot(imhist(retinex_R));

subplot(1,3,2);
plot(imhist(retinex_G));

subplot(1,3,3);
plot(imhist(retinex_B));
% retinex_R = im2uint8(retinex_R);
% retinex_G = im2uint8(retinex_G);
% retinex_B = im2uint8(retinex_B);

% retinex_R = imadjust(retinex_R,[min(retinex_R(:)), max(retinex_R(:))]);
% retinex_G = imadjust(retinex_G,[min(retinex_G(:)), max(retinex_G(:))]);
% retinex_B = imadjust(retinex_B,[min(retinex_B(:)), max(retinex_B(:))]);
% 
% figure;
% subplot(1,3,1);
% plot(imhist(retinex_R));
% 
% subplot(1,3,2);
% plot(imhist(retinex_G));
% 
% subplot(1,3,3);
% plot(imhist(retinex_B));
% 
% retinex_R = im2uint8(retinex_R);
% retinex_G = im2uint8(retinex_G);
% retinex_B = im2uint8(retinex_B);

o_img = cat(3, retinex_R, retinex_G, retinex_G);

figure;
imshow(o_img*0.75);
