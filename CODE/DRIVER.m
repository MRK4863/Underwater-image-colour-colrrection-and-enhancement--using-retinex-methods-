clc;
clear all;
close all;

img = imread("E:\GitHub\Underwater-image-colour-colrrection-and-enhancement--using-retinex-methods-\SAMPLE_IMAGES\383_img_.png");

i = [img img(:, end-847:end, :)];
i = [i; i(end-173:end, :, :)];

red_comp_img = red_channel_compensation(img,0.8,5);

white_bal_img = white_balance(red_comp_img);

% img_hsv = rgb2hsv(white_bal_img);
% 
% retinex = retinex_mccann99(img_hsv(:,:,3),2);
% 
% img_hsv_enhanced = cat(3, img_hsv(:,:,1), img_hsv(:,:,2), retinex);
% img_retinex_rgb = hsv2rgb(img_hsv_enhanced);
% 
% histeq_img = adaptive_histogram_equalization(img_retinex_rgb);

img_retinex_rgb = retinex_path_mcann(white_bal_img);

histeq_img = adaptive_histogram_equalization(white_bal_img);

%eval_metrics(histeq_img);

figure(1)
    subplot(2,3,1);
    imshow(img(:,:,:));
    title('Original image');

    subplot(2,3,2);
    imshow(red_comp_img(:,:,:));
    title('Red colour compensation');

    subplot(2,3,3);
    imshow(white_bal_img(:,:,:));
    title('White Balance');

    subplot(2,3,4);
    imshow(img_retinex_rgb(:,:,:));
    title('Retinex');

    subplot(2,3,5);
    imshow(histeq_img(:,:,:));
    title('Adaptive histogram equalization');
